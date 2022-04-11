//
//  TournamentNavigation.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/11.
//

//
//  Tournament_navigation.swift
//  Mega-Pig
//
//  Created by 조성산 on 2022/04/10.
//

import SwiftUI

struct TournamentNavigation: View {
    var body: some View {
        ZStack{
            //            NavigationView{
//                ScrollView{
//                    NavigationLink("Hello, world?", destination: MyOtherScreen())
//                    Text("Hello, World")
//                }
//                .navigationTitle("All INboxes")
//            }
            
//                GeometryReader{ proxy in
//                    let frame = proxy.frame(in: .global)
//
//                    Tournament()
//                }
//                GeometryReader { proxy in BlurView(style: .systemThinMaterialDark)}
                
//                    Text("토너먼트 오픈까지")
//                        .fontWeight(.bold)
//                        .font(.system(size: 25))
//                        .foregroundColor(Color.accentColor)
//
//                    Text("Placeholder")
//                        .fontWeight(.bold)
//                        .font(.system(size: 25))
//                        .foregroundColor(Color.accentColor)
                    
                    NavigationView{
                        
                        ScrollView{
                            VStack{
                                Image("myfood01")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                                    .blur(radius: 5)
                            
                            Text("토너먼트 오픈까지")
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .foregroundColor(Color.accentColor)
                            NavigationLink("지난 결과 확인", destination: OtherScreen())
                            

//                                GeometryReader{ proxy in
//                                    let frame = proxy.frame(in: .global)
//
//                                    Tournament()
//                                }
//                                GeometryReader { proxy in BlurView(style: .systemThinMaterialDark)}
                            
                                
                                Text("남은 시간")
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.accentColor)
                                TournamentTimer()

                            }
                            
                            

                            
                        
                           
                        }

                    }
    
                    
                    

                    
                
            
        }
    }
}

struct OtherScreen: View{
    var body: some View {
        TournamentResult()
    }
}

struct Tournament_navigation_Previews: PreviewProvider {
    static var previews: some View {
        TournamentNavigation()
    }
}

