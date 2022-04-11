//
//  QuestionCardView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI

struct QuestionCardView: View {
    
    @State var comment:String = ""
    
    var body: some View {
        
        ZStack{
            VStack{
                Spacer()
                Text("질문 작성")
                    .font(.system(size: 15, design: .default))
                    .frame(width: UIScreen.screenWidth, height: 50,alignment: .center)
                    .padding(15)
                
                TextEditor(text: $comment)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .multilineTextAlignment(.leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 19)
                            .stroke(MINTCOLOR, lineWidth: 2)
                            .frame(width: UIScreen.screenWidth*0.95, alignment: .center)
                    )
            }
            Button(action: {
                print("버튼 누름!")
            }){
                Text("완료")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(7)
                    .border(MINTCOLOR, width: 1)
            }
            .background(MINTCOLOR)
            .cornerRadius(8)
            .frame(width: 100, height: 100)
            .position(x: UIScreen.screenWidth-10, y: 17)
        }
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
let MINTCOLOR = Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255)
//UIScreen.screenWidth
//UIScreen.screenHeight
