//
//  DailyView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1)
                
        return String(self[startIndex ..< endIndex])
    }
}

struct DailyView: View {
    
    @State var ymd:String = "2XXX.01.04"
    @State var dayOfWeek:String = "월요일"
    @State var dayNum:Int = 0
    @State var count: Int = 0
    
    @State var eatAmount:CGFloat = 0
    @State var resAmount:CGFloat = 0
    
    @State public var buttonSelected: Int?
    
    @State var buttons = [1, 2, 3, 4, 5, 6, 7]
    let day = ["일", "월", "화", "수", "목", "금", "토"]
    let nutrient = ["탄수화물", "단백질", "지방"]
    static let nutColor = [
        Color(red: 255 / 255, green: 159 / 255, blue: 10 / 255, opacity: 1.0),
        Color(red: 10 / 255, green: 132 / 255, blue: 255 / 255, opacity: 1.0),
        Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255, opacity: 1.0)]
    
    public let values: [Double]
    public var colors: [Color]
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    func selectedDateIs()  -> Int{
        for date in day
        {
            if(dayOfWeek == "\(date)요일")
            {
                dayNumIs(n: count)
                return count
            }
            count += 1
        }
        return 0
    }
    
    func dayNumIs(n: Int) -> Void {
        for i in 0...buttons.count-1 {
            if n == i
            {
                buttons[i] = dayNum
            }
            else
            {
                buttons[i] = dayNum - n + i
            }
        }
    }
    
    func ymdChange() -> Void {
        let tempDay = dayNum - count + buttonSelected! < 10 ? "0" + String(dayNum - count + buttonSelected!) : String(dayNum - count + buttonSelected!)
        ymd = ymd.substring(from: 0, to: 7) + String(tempDay)
        print(ymd)
    }
    
    func barChartColorChange() -> Color {
        if (resAmount < eatAmount)
        {
            return Color.red
        }
        else if (resAmount * 0.8 < eatAmount)
        {
            return Color.yellow
        }
        else
        {
            return Color.accentColor
        }
    }
    
    func barChartFullFill(w: CGFloat) -> CGFloat {
        if (resAmount < eatAmount)
        {
            return w * 0.8
        }
        else
        {
            return (w * 0.8) * CGFloat((Float)(eatAmount/resAmount))
        }
    }
    
    func barChartBackgroundColor() -> Color {
        var color: Color = Color.white
        if (resAmount < eatAmount)
        {
            color = Color.red.opacity(0.3)
        }
        else if (resAmount * 0.8 < eatAmount)
        {
            color = Color.yellow.opacity(0.3)
        }
        else
        {
            color = Color.accentColor.opacity(0.3)
        }
        return color
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let topHeight = height * 0.13
            let bottomHeight = height * 0.87
            let bottomTHeight = bottomHeight * 0.4
            let bottomBHeight = bottomHeight * 0.6
            let graphWidth = width * 0.9
                VStack(spacing: 0){
                    NavigationView(){
                    }
                        .navigationTitle(ymd)
                        .navigationViewStyle(StackNavigationViewStyle())
                        .navigationBarTitleDisplayMode(.inline)
                        .background(Color.blue)
                        .onAppear() {
                            buttonSelected = selectedDateIs()
                        }.frame(alignment: .center)
                    VStack(){
                        HStack(spacing: 0)
                        {
                            ForEach(day, id: \.self) {string in
                                Text("\(string)").frame(width: width/7, height: topHeight * 0.2, alignment: .center)
                                   }
                        }
                        HStack(spacing: 0) {
                            ForEach(0..<7){
                                button in Button(action: {
                                    self.buttonSelected = button
                                    print("selected button changed!")
                                    ymdChange()
                                    CalendarView().date = Date().dateChange(d: ymd)
                                    print("CalendarViews ::: \(CalendarView().date)")
                            }) {
                                Text("\(self.buttons[button])")
                                    .frame(width: width/7, height: topHeight * 0.52, alignment: .center)
                                    .foregroundColor(.black)
                                    .background(self.buttonSelected == button ? Color.accentColor : Color.white)
                                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 1))
                            }.clipShape(Circle())
                            }
                            
                        }
                    }.frame(width: width, height: topHeight, alignment: .center)
                    VStack(spacing: 0){
                        VStack(spacing: graphWidth * 0.03){
                            HStack(spacing: graphWidth * 0.1)
                            {
                                ZStack(){
                                    ForEach(0..<self.values.count){ i in
                                        PieSliceView(pieSliceData: self.slices[i])
                                    }
                                    .frame(width: graphWidth * 0.4, height: graphWidth * 0.4)
                                }
                                .foregroundColor(Color.white)
                                VStack(spacing: height * 0.005) {
                                    ForEach(0..<self.nutrient.count) {i in
                                        HStack() {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(DailyView.nutColor[i])
                                                .frame(width: graphWidth * 0.07, height: graphWidth * 0.07, alignment: .leading)
                                            Text(nutrient[i]).font(.callout)
                                                .frame(alignment: .trailing)
                                        }.frame(width: graphWidth * 0.3, alignment: .leading)
                                    }
                                }
                            }
                            VStack(spacing: bottomTHeight * 0.02){
                                RoundedRectangle(cornerRadius: 10).fill(barChartBackgroundColor())
                                    .frame(width: graphWidth * 0.8, height: bottomTHeight * 0.12)
                                    .overlay()
                                {
                                    VStack(alignment: .leading)
                                    {
                                        RoundedRectangle(cornerRadius: 10).fill(barChartColorChange())
                                            .frame(width: barChartFullFill(w: graphWidth), height: bottomTHeight * 0.12)
                                    }.frame(width: graphWidth * 0.8, height: bottomTHeight * 0.12, alignment: .leading)
                                }
                                HStack(spacing: width * 0.01) {
                                    Text("\((Int)(eatAmount))")
                                    Text(" / ")
                                    Text("\((Int)(resAmount))")
                                    Text(" kcal")
                                }
                            }
                        }.frame(width: graphWidth, height: bottomTHeight, alignment: .center)
                            .background(Color.gray)
                        VStack(spacing: 0){
                            VStack(){
                                
                            Text("Photo Area")
                            }
                                .frame(width: graphWidth * 0.9, height: bottomBHeight * 0.9, alignment: .center)
                                    .background(Color.red)
                                
                        }.frame(width: graphWidth, height: bottomBHeight, alignment: .center)
                            .background(Color.brown)
                        
                    }.frame(width: width, height: bottomHeight, alignment: .center)
//                        .background(Color.teal)
                        
                }
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(values: [1300, 500, 300], colors: DailyView.nutColor)
    }
}
