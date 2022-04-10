//
//  login_View.swift
//  Mega-Pig
//
//  Created by dohankim on 2022/04/07.
//

import SwiftUI

struct login_View: View {
    @State var username:String = ""
    @State var password:String = ""
    var body: some View {
        NavigationView{
        VStack(spacing: 10) {
          Image("gyo_pig")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Login")
                .bold()
                .font(.title)
            Text("언제나 초록 돼지...").font(.subheadline)
          TextField("Email",text: $username)
                .padding()
                .background(Color(.systemGray6))
                
          SecureField("Password",text: $password)
                .padding()
                .background(Color(.systemGray6))
                
            Button(action: {find_Pw_View()}, label: {
              HStack {
                Spacer()
                Text("Login")
                   .foregroundColor(.white)
                Spacer()
                }.padding()
                 .background(Color.accentColor)
                 
            })
            HStack{NavigationLink(destination: signup_email_View()
                ) {
                Text("회원가입   |")}
                NavigationLink(destination: find_Pw_View()) {
                    Text("비밀번호 찾기")}
            }
            
                }
          
         
            .padding()}
        }
    }


struct login_View_Previews: PreviewProvider {
    static var previews: some View {
        login_View()
            .previewInterfaceOrientation(.portrait)
    }
}
