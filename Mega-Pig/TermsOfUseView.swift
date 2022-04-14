//
//  TermsOfUseView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/13.
//

import SwiftUI

struct TermsOfUseView: View {
    let termsOfUse = "ABCDeidkdkdj ielskdjfiwldk fieksljaielfkj baaiejfkee kfjdisdkfjkjasdkfjwoiefdkjf. dijksudikm,difjawo eifjdkslfhril sidkfqoeidkfhsls diodfkdlfadjfao jidfs lkoiewfdakdf kloiefjfie eikdddddifjkjweoijf wiekdjflsiejfdkdkdjsidjfkj ieldkfj dkdiefjdkfj."
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            ScrollView()
            {
                VStack
                {
                    ZStack
                    {
                        VStack(spacing: width * 0.005){
                            ForEach(1..<21) {
                                index in
                                Text("제\(index)조").font(.system(size: 16)).frame(width: width * 0.84, alignment:.leading).padding(.top, width * 0.03)
                                Text(termsOfUse).font(.system(size: 14))
                                    .padding(.horizontal, width * 0.03)
                                    .padding(.bottom, width * 0.03)
                                    .frame(width: width * 0.92)
                            }
                        }.background(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor))
                    }
                }.frame(width: width * 0.95, alignment: .center)
            }.frame(width: width, alignment: .center)
        }.navigationTitle("앱 사용약관")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TermsOfUseView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfUseView()
    }
}
