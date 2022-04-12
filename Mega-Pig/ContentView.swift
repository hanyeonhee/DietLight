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
        Button( action: {viewModel.signout()}, label:{ Text("sign out")})
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
