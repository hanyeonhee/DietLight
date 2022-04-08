//
//  CalenderView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

struct CalenderView: View {
    @State private var date = Date()
    @State var navigationActive = false
    
    let titleSize: CGFloat = 28
    let sTitleSize: CGFloat = 20
    let word: CGFloat = 22
    
    let components: [String] = ["목표 칼로리", "일일 평균 섭취량", "목표 달성 일수", "이번 달의 원픽"]
    let unit: [String] = ["kcal", "개"]
    
    @State private var comValue: [CGFloat] = [2300, 2205.5, 2, 10]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let componentWidth = width * 0.55
            let valueWidth = width * 0.25
            let kcalWidth = width * 0.2
            let topHeight = height * 0.55
            let bottomHeight = height * 0.45
            
            VStack(spacing: 0) {
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .frame(width: width, height: topHeight, alignment: .center)
                .onChange(of: date, perform: {newDate in
                    print("selected date: \(newDate)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05)
                    {navigationActive = true}
                })
                VStack(spacing: 0){
                    Label("Summary", systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: titleSize) ).frame(maxWidth: .infinity, alignment: .center).padding(.vertical, (bottomHeight * 0.02)).frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                    HStack {
                        Label(components[0], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading)
                        Label(String(format: "%.f", comValue[0]), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                        Label(unit[0], systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                    }.frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                    HStack {
                        Label(components[1], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading)
                        Label(String(format: "%.f", comValue[1]), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                        Label(unit[0], systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                    }.frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                    HStack {
                        Label(components[2], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading)
                        Label(String(format: "%.f", comValue[2]), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                        Label(unit[1], systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                    }.frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                    HStack {
                        Label(components[3], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading)
                        Label(String(format: "%.f", comValue[3]), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                        Label(unit[0], systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                    }.frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                    
//                    .padding(.vertical, bottomHeight * 0.02)
                }.background(Color.accentColor)
                    .frame(width: width, height: bottomHeight, alignment: .top)
            }
        }
    }

}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
