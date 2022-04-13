//
//  TournamentWinningRate.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

import SwiftUI

struct TournamentWinningRate: View {
    var body: some View {
        HStack(spacing: 10){
                   
    

                   
                   VStack(alignment: .leading, spacing: 0){
                       Divider().opacity(0)
                       
                       HStack(spacing :5){
                                       Image("myfood001")
                                           .resizable()
                                           .frame(width: 50, height: 50)


//                       Spacer().frame(height: 5)
//                       Capsule()
//                               .fill(Color("LightBlue"))
//                               .frame(width: 8)
//                               .frame(height: 40)
                      

                           HStack(){
                               BarChart(percentage: .constant(0.60))
                                   .frame(width:160, height:10)
//                       Text("ggg")
//                           .fontWeight(.bold)
//                           .font(.system(size: 25))
//                           .foregroundColor(Color.white)
//
//                       Spacer().frame(height: 5)
                           }
                           HStack{
                               BarChart(percentage:.constant(0.40))
                                   .frame(width:160, height: 10)
//                       Text("ggg")
//                               .fontWeight(.bold)
//                               .font(.system(size: 25))
//                           .foregroundColor(Color.white)
                           }
                       }
                       
                   }
                   
                   
                   
               }
               .padding(20)
               .background(Color.white)
               .cornerRadius(10)
    }
}

struct TournamentWinningRate_Previews: PreviewProvider {
    static var previews: some View {
        TournamentWinningRate()
    }
}
