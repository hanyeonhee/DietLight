//
//  DailyView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

struct DailyView: View {
    @State var ymd:String = "2XXX.01.04"
    
    func SizeIs(a: CGFloat, b: CGFloat) -> CGFloat{
        if(a > b)
        {
            return b * 0.9
        }
        else
        {
            return a * 0.9
        }
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
                    VStack(){
                        Text("Week Calendar")
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
//                            .frame(width: SizeIs(a: graphWidth, b: bottomBHeight), height: SizeIs(a: graphWidth, b: bottomBHeight), alignment: .center)
//                                .background(Color.red)
                                .frame(width: graphWidth * 0.9, height: bottomBHeight * 0.9, alignment: .center)
                                    .background(Color.red)
                                
                        }.frame(width: graphWidth, height: bottomBHeight, alignment: .center)
                            .background(Color.brown)
                        
                    }.frame(width: width, height: bottomHeight, alignment: .center)
                        .background(Color.teal)
                        
                }
            }
            
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
