//
//  TournamentView.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct TournamentView: View {
    var body: some View {
        VStack {
            Text("2022년 3월 14일")
                .foregroundColor(Color.accentColor)
                .font(.system(size: 20))
            Text("푸드 토너먼트")
                .foregroundColor(Color.accentColor)
                .font(.system(size: 30))
            VStack {
                
                VStack {
                    VStack {
                        Button(action: {print("Button1")}){
                            Image("myfood01")
                                .resizable()
                                .scaledToFit()
                        }
                            Text("vs")
                            .font(.system(size: 25))
                        
                        }
                    Button(action: {print("Button2")}){
                            Image("myfood02")
                                .resizable()
                                .scaledToFit()
                    }
                }.padding()
            }
            
        }
    }
}

struct TournamentView_Previews: PreviewProvider {
    static var previews: some View {
        TournamentView()
    }
}
