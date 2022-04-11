//
//  TabView.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct TabView1: View {
    var body: some View {
        
        GeometryReader{ geometry in
            VStack(spacing:0) {
                TabView {
                    CalendarView()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                        .tabItem {
                        Image(systemName: "calendar")
                        Text("Calendar")
                        }.tag(1)
                    TournamentView()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                        .tabItem {
                        Image(systemName: "flame")
                        Text("Tournament")
                        }.tag(2)
                    Camera()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                        .tabItem {
                        Image(systemName: "camera")
                        Text("Camera")
                        }.tag(3)
                    Ranking()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                        .tabItem {
                        Image(systemName: "list.number")
                        Text("Ranking")
                        }.tag(4)
                    MyPage()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                        .tabItem {
                        Image(systemName: "person")
                        Text("My Page")
                        }.tag(5)

                }
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
        
    }
}

struct TabView1_Previews: PreviewProvider {
    static var previews: some View {
        TabView1()
    }
}
