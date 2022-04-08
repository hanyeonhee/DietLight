//
//  MainTabView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        VStack {
            TabView {
                CalenderView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }.tag(1)
                ContentView()
                .tabItem {
                    Image(systemName: "network")
                    Text("WorldCup")
                }.tag(2)
                ContentView()
                .tabItem {
                    Image(systemName: "camera")
                    Text("Camera")
                }.tag(3)
                ContentView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Ranking")
                }.tag(4)
                ContentView()
                .tabItem {
                    Image(systemName: "person")
                    Text("My Page")
                }.tag(5)
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
