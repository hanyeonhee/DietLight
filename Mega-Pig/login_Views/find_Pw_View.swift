//
//  find_Pw_View.swift
//  Mega-Pig
//
//  Created by dohankim on 2022/04/07.
//

import SwiftUI

struct find_Pw_View: View {
    @State var useremail:String = "___________"
    @State var email:String = ""
    @State private var showingAlert = false
    @State private var message:String = "dsfsd"
    @State private var emailAlert = false
    var body: some View {
        VStack(alignment:.leading, spacing:20){
            VStack(alignment:.leading, spacing:20){
                
                HStack{
                    
                        Text("비밀번호 재설정 이메일 보내기")
                            .font(.title)
                            .padding(.leading)
                            
                    Spacer()
                }
                
                TextField("이메일을 입력하세요",text: $email)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                    .cornerRadius(5.0)
                HStack{
                    Button("이메일 확인") {
                        if isValidEmail(id: email){
                            message="이메일이 확인 되었습니다."
                            emailAlert=true
                            useremail=email
                        }
                        else{
                            message="유효한 이메일을 적어주새요."
                        }
                        self.showingAlert.toggle()
                    }
                    .padding(.all, 10.0)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .alert(isPresented: $showingAlert) {
                               Alert(title: Text(message), message: nil,
                                     dismissButton: .default(Text("확인")))
                           }
                }
                .padding(.leading)
                
                
                
                
               Text(useremail+" 로 재설정 이메일을 송신하겠습니다.")
                    .padding()
                Spacer()
                if emailAlert{
                    NavigationLink(destination: login_View().navigationBarHidden(true), label: {
                                    HStack {
                                      Spacer()
                                      Text("이메일 보내기")
                                         .foregroundColor(.white)
                                      Spacer()
                                    }.padding()
                                       
                                       
                                        .background(Color.accentColor)
                                  })
                    .padding()}
                    }
        }
        }
}

//이메일 형식 검사
func isValidEmail(id: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: id)
    }


struct find_Pw_View_Previews: PreviewProvider {
    static var previews: some View {
        find_Pw_View()
    }
}
