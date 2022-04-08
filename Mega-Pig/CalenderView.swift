//
//  CalenderView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

struct CalenderView: View {
    @State private var date = Date()
    
    let titleSize: CGFloat = 28
    let sTitleSize: CGFloat = 20;
    let word: CGFloat = 22;
    
    let components: [String] = ["목표 칼로리", "일일 평균 섭취량", "일일 평균 식단수", "목표 달성 일수"]
    let unit: [String] = ["kcal", "개", "일"]
    
    @State private var comValue: [CGFloat] = [2300, 2205.5, 2, 10]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let componentWidth = width * 0.55
            let valueWidth = width * 0.25
            let kcalWidth = width * 0.2
            VStack {
                
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
//            .padding([.bottom,.top])
//                .padding(.bottom, height * 0.02)
                VStack{
                    Label("Summary", systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: titleSize) ).frame(maxWidth: .infinity, alignment: .center).padding(.vertical, width * 0.02)
                    
                    HStack {
                        Label(components[0], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading).padding()
                        Label(String(format: "%.f", comValue[0]), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                        Label(unit[0], systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                    }
                    HStack {
                        Label(components[1], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading).padding()
                        Label(String(format: "%.02f", comValue[1]), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                        Label(unit[0], systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                    }
                    HStack {
                        Label(components[2], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading).padding()
                        Label(String(format: "%.f", comValue[2]), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                        Label(unit[1], systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                    }
                    HStack {
                        Label(components[3], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading).padding()
                        Label(String(format: "%.f", comValue[3]), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                        Label(unit[2], systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/).padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                    }
                    
                }.background(Color.accentColor)
            }
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
