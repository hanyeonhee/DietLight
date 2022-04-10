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
    
    @State public var buttonSelected: Int?
    
    @State var buttons = [1, 2, 3, 4, 5, 6, 7]
    let day = ["일", "월", "화", "수", "목", "금", "토"]
    
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
                        VStack (){
                            Text("Pie Chart Area")
                            Text("Bar Chart Area")
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
        DailyView()
    }
}
