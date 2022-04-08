//
//  DailyView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

struct DailyView: View {
    @State var ymd:String = "2XXX.01.04"
    
    var body: some View {
        NavigationView{
                    Text("Daily View")
        }
        .navigationTitle(ymd)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
