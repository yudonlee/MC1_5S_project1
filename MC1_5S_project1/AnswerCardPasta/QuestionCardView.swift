//
//  QuestionCardView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI

struct QuestionCardView: View {
    
    @State var comment:String = ""
    @State var certified:Bool = true
    @State var anonymous:Bool = false
    @State var isLinkAlive:Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: QuestionDetailView(index: postContentList.count), isActive: $isLinkAlive) {
                    Button(action: {
                        // certified user 인지 아닌 지 checkbox로 받기
                        // anonymous인지 아닌지 checkbox로 받기
                        let comment_input = String(comment)
                        let name = UserInformation.loginUser.name ?? ""
                        let created_at = Date()
                        addNewContent(title: comment_input, name: name, created_at: created_at, updated_at: created_at, certifiedUser: true, isAnonymous: anonymous, answerCount: "0")
                        self.isLinkAlive = true
                    }){
                            Text("완료")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(7)
                                .border(MINTCOLOR, width: 1)
                    }
                }
                .background(MINTCOLOR)
                .cornerRadius(8)
                .frame(width: 100, height: 100)
                .position(x: UIScreen.screenWidth-10, y: 17)
                VStack{
                    Spacer()
                    Text("질문 작성")
                        .font(.system(size: 19, design: .default))
                        .frame(width: UIScreen.screenWidth, height: 50,alignment: .center)
                        .padding(15)
                    Toggle(isOn: $anonymous)
                    {
                        Label("익명으로 질문하기", systemImage: "checkmark.square")
                    }
                    .toggleStyle(.button)
                    .frame(width: UIScreen.screenWidth*0.95, height: 15, alignment: .trailing)
                    .padding()
                    TextEditor(text: $comment)
                        .padding(EdgeInsets(top: 5, leading: 25, bottom: 5, trailing: 25))
                        .multilineTextAlignment(.leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 19)
                                .stroke(MINTCOLOR, lineWidth: 2)
                                .frame(width: UIScreen.screenWidth*0.95, alignment: .center)
                        )
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView()
            .previewInterfaceOrientation(.portrait)
    }
}
let MINTCOLOR = Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255)
//UIScreen.screenWidth
//UIScreen.screenHeight
