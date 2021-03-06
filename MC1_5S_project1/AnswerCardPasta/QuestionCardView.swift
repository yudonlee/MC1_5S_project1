//
//  QuestionCardView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI

struct QuestionCardView: View {
    
    @EnvironmentObject var viewModel: postViewModel
    
    @State var comment:String = ""
    @State var certified:Bool = true
    @State var anonymous:Bool = false
    @State var isLinkAlive:Bool = false
    var body: some View {
            ZStack{
                NavigationLink(destination: QuestionDetailView(index: 0), isActive: $isLinkAlive) {
                    Button(action: {
                        // certified user 인지 아닌 지 checkbox로 받기
                        // anonymous인지 아닌지 checkbox로 받기
                        let commentInput = String(comment)
                        let name = UserInformation.loginUser.name ?? ""
                        let createdAt = Date()
                        
                        viewModel.postContents.append(PostContent(title: commentInput, name: name, index: "\(viewModel.postContents.count + 1)", created_at: createdAt, updated_at: createdAt, certifiedUser: false, isAnonymous: anonymous, answerCount: "0", answer: []))
                        self.isLinkAlive = true
                    }){
                        HStack{
                            
                            Text("Done")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(4)
                                .border(Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255), width: 1)
                                .padding(5)
                                .background(Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255))
                                .cornerRadius(8)
    //                        Spacer(minLength: 10)
                            Text("")
                                .foregroundColor(.white)
                                .padding(4)
                                .padding(5)
                                .cornerRadius(8)
                        }
                        
                    }
                }
    //            .background(MINTCOLOR)
    //            .cornerRadius(8)
    //            .frame(width: 100, height: 100)
                .position(x: UIScreen.screenWidth-10, y: 17)
                VStack{
                    Spacer()
                    Text("Ask")
                        .font(.system(size: 19, design: .default))
                        .frame(width: UIScreen.screenWidth, height: 50,alignment: .center)
                        .padding(15)
                    Toggle(isOn: $anonymous)
                    {
                        Label("Unknown", systemImage: "checkmark.square")
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
    //        .navigationBarHidden(true)
            .navigationBarTitle("") //질문하기-완료-뒤로가기
    }
    
}

//struct QuestionCardView: View {
//
//    @EnvironmentObject var viewModel: postViewModel
//
//    @State var comment:String = ""
//    @State var certified:Bool = true
//    @State var anonymous:Bool = false
//    @State var isLinkAlive:Bool = false
//    var body: some View {
//        NavigationView{
//            ZStack{
//                NavigationLink(destination: QuestionDetailView(index: postContentList.count), isActive: $isLinkAlive) {
//                    Button(action: {
//                        // certified user 인지 아닌 지 checkbox로 받기
//                        // anonymous인지 아닌지 checkbox로 받기
//                        let comment_input = String(comment)
//                        let name = UserInformation.loginUser.name ?? ""
//                        let created_at = Date()
//
//                        viewModel.addNewContent(title: comment_input, name: name, created_at: Date(), updated_at: Date(), certifiedUser: true, isAnonymous: anonymous, answerCount: "0")
////                        addNewContent(title: comment_input, name: name, created_at: created_at, updated_at: created_at, certifiedUser: true, isAnonymous: anonymous, answerCount: "0")
//                        self.isLinkAlive = true
//                    }){
//                            Text("완료")
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                                .padding(7)
//                                .border(MINTCOLOR, width: 1)
//                    }
//                }
//                .background(MINTCOLOR)
//                .cornerRadius(8)
//                .frame(width: 100, height: 100)
//                .position(x: UIScreen.screenWidth-10, y: 17)
//                VStack{
//                    Spacer()
//                    Text("질문 작성")
//                        .font(.system(size: 19, design: .default))
//                        .frame(width: UIScreen.screenWidth, height: 50,alignment: .center)
//                        .padding(15)
//                    Toggle(isOn: $anonymous)
//                    {
//                        Label("익명으로 질문하기", systemImage: "checkmark.square")
//                    }
//                    .toggleStyle(.button)
//                    .frame(width: UIScreen.screenWidth*0.95, height: 15, alignment: .trailing)
//                    .padding()
//                    TextEditor(text: $comment)
//                        .padding(EdgeInsets(top: 5, leading: 25, bottom: 5, trailing: 25))
//                        .multilineTextAlignment(.leading)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 19)
//                                .stroke(MINTCOLOR, lineWidth: 2)
//                                .frame(width: UIScreen.screenWidth*0.95, alignment: .center)
//                        )
//                }
//            }
//            .navigationBarHidden(true)
//        }
//    }
//}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView()
            .previewInterfaceOrientation(.portrait)
    }
}
let MINTCOLOR = Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255)
//UIScreen.screenWidth
//UIScreen.screenHeight
