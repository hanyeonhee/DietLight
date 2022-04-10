//
//  signup_email_View.swift
//  Mega-Pig
//
//  Created by dohankim on 2022/04/07.
//

import SwiftUI

struct signup_email_View: View {
    @State var email:String = ""
    @State var nickname:String = ""
    @State var password:String = ""
    @State var repassword:String = ""
    @State private var showingAlert = false
    @State private var emailAlert = true
    @State private var pwAlert = false
    @State private var message:String = "dsfsd"
    @State private var warn:String = "유효한 이메일을 입력해 주세요."
    @State var signInSuccess = false
    @State private var showError = false
        
    var body: some View {
        
        VStack(alignment:.leading, spacing:20){
            VStack(alignment:.leading, spacing:20){
                Text("이메일")
                    .font(.subheadline)
                    .padding(.leading)
                    
                TextField("이메일을 입력하세요",text: $email)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                    .cornerRadius(5.0)
                    
                    
            }
            VStack(alignment:.leading, spacing:20){
                Text("닉네임")
                    .font(.subheadline)
                    .padding(.leading)
                    
                TextField("닉네임을 입력하세요",text: $nickname)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                    .cornerRadius(5.0)
                    
            }
            VStack(alignment:.leading, spacing:20){
                Text("비밀번호 (8자리 이상의 숫자,소문자)")
                    .font(.subheadline)
                    .padding(.leading)
                    
                SecureField("비밀번호를 입력하세요",text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                    .cornerRadius(5.0)
                    
            }
            VStack(alignment:.leading, spacing:20){
                HStack{ Text("비밀번호 재입력")
                        .font(.subheadline)
                        .padding(.horizontal)
                    Button("비밀번호 일치 확인") {
                        if isValidPassword(pwd: password){
                            message="비밀번호가 일치하지 않습니다."
                            if password==repassword{
                                message="비밀번호가 일치합니다!"
                                pwAlert=true
                            }
                        }
                        else{
                            message="비밀번호 형식에 맞춰 주십시오."
                        }
                        self.showingAlert.toggle()
                    }
                    .padding(.all, 7.0)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .alert(isPresented: $showingAlert) {
                               Alert(title: Text(message), message: nil,
                                     dismissButton: .default(Text("확인")))
                           }

                }
               
                
                SecureField("비밀번호를 재입력하세요",text: $repassword)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                    .cornerRadius(5.0)
                    
            }
           
            
            Button(action: {
                            // Your auth logic
                            if(isValidEmail(id: email)) {
                                warn="비밀번호가 일치하는지 확인해주세요."
                                self.showError=true
                                if(pwAlert==true){
                                    if nickname==""{
                                        warn="모든칸을 기입해 주세요."
                                    }
                                    else{
                                        warn=""
                                        signInSuccess=true
                                        
                                    }
                                }
                            }
                            else {
                                warn="유효한 이메일을 기입하여 주세요."
                                self.showError = true
                            }
                            
                        })
            {HStack{
                Spacer()
                Text("완료")
        
        .foregroundColor(Color.white)
                Spacer()
            }.padding()
            .background(Color.accentColor)
                        }
           
            if showError {
                
            Text(warn).foregroundColor(Color.red)
                        }
            if signInSuccess{
                NavigationLink(destination: login_View().navigationBarHidden(true), label: {
                                HStack {
                                  Spacer()
                                  Text("로그인 페이지로 이동")
                                     .foregroundColor(.white)
                                  Spacer()
                                }.padding()
                                   
                                   
                                    .background(Color.accentColor)
                              })
            }
            
            Spacer()
                
        }
        .padding()
    }
    //이메일 형식 검사
    func isValidEmail(id: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: id)
        }
    //비밀번호 형식검사
    func isValidPassword(pwd: String) -> Bool {
            let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            return passwordTest.evaluate(with: pwd)
        }
    
}

struct signup_email_View_Previews: PreviewProvider {
    static var previews: some View {
        signup_email_View()
    }
}

struct ButtonView: View {
var body: some View {
    Text("완료")
        .frame(width: 200, height: 100, alignment: .center)
        .background(Color.yellow)
        .foregroundColor(Color.red)
}
}
