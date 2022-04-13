//
//  TournamentResult.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct TournamentResult: View {
    var body: some View {
        ZStack {
        //GeometryReader
            VStack {
                VStack {
                    Text("푸드 토너먼트 결과")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color.accentColor)
                    
                }
                VStack(alignment: .leading, spacing: 5){
                    Divider().opacity(0)
                    
                    HStack(spacing :40){
                    Spacer().frame(height: 5)
                    
                    Text("우승 확율")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color.black)
                    
                    Spacer().frame(height: 1)
                    
                    Text("승률")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                        .foregroundColor(Color.black)
                        Spacer().frame(height:5)

                    }

                }
                .padding(5)
                .background(Color.white)
                .cornerRadius(10)


                    VStack{
                        VStack(spacing:5) {
                            TournamentWinningRate()
                            TournamentWinningRate()
                            TournamentWinningRate()
                            TournamentWinningRate()
                            TournamentWinningRate()




                        }
     
                    }

                
                .padding()
            }
        }

    }
}

struct TournamentResult_Previews: PreviewProvider {
    static var previews: some View {
        TournamentResult()
    }
}
