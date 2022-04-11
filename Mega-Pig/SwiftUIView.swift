////
////  SwiftUIView.swift
////  Mega-Pig
////
////  Created by 조성산 on 2022/04/11.
////
//
//import SwiftUI
//
//struct TwoChoices {
//var Image1: Image;
//var Image2: Image;
//init(Image1 img: String, Image2 img2: String) {
//Image1 = Image(img)
//Image2 = Image(img2)
//}
//}
//
//struct SwiftUIView: View {
//@State private var currentQuestion = 0
//@State private var correctAnswers = 0
//var twochoices : [TwoChoices] =
//[TwoChoices(Image1: "myfood01", Image2: "myfood02"),
//TwoChoices(Image1: "myfood02", Image2: "myfood01")
//]
//
//    var body: some View {
//            VStack{
//                
//                
//                HStack {
//                    VStack{
//                        Button(twochoices[currentQuestion].Image1)
//                            .padding()
//                            .frame(width: 170, height: 50)
//                            .clipShape(Rectangle())
//
//                    }.padding()
//                    VStack {
//                        Button(twochoices[currentQuestion].Image2)
//                            .padding()
//                            .frame(width: 170, height: 50)
//                            .clipShape(Rectangle())
//
//                    }.padding()
//                }
//            }
//
//        }
//        
//    }
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
