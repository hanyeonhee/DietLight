//
//  ContentView.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/07.
//

import SwiftUI




struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        GeometryReader { geometry in
                    VStack(spacing: 0) {
                        TabView {
                            CalendarView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
                                Image(systemName: "calendar")
                                Text("Calendar")
                            }.tag(1)
                            TestView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
                                Image(systemName: "network")
                                Text("WorldCup")
                            }.tag(2)
                            TestView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
                                Image(systemName: "camera")
                                Text("Camera")
                            }.tag(3)
                            TestView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
                                Image(systemName: "1.circle")
                                Text("Ranking")
                            }.tag(4)
                            TestView().frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .center)
                            .tabItem {
                                Image(systemName: "person")
                                Text("My Page")
                            }.tag(5)
                        }
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
