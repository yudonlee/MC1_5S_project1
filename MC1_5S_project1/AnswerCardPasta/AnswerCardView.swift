//
//  AnswerCardView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

struct QuestionCard: View {
    
    var post: PostContent
    let maxLength:Int
    let questionTitle:String
    let imgIndex:Int
    
    init(post:PostContent, maxLength:Int = 400) {
        self.maxLength = maxLength
        if post.title.count <= maxLength {
            self.questionTitle = post.title
        }else{
            let start = post.title.index(after: post.title.startIndex)
            let end = post.title.index(post.title.startIndex, offsetBy: self.maxLength)
            self.questionTitle = String(post.title[start...end]+"\n...")
        }
        self.post = post
        self.imgIndex = Int.random(in: 1...12)
    //        self.post = post
    }
    
    
    var body: some View{
        ZStack
        {
            Image("bg"+String(self.imgIndex))
                .resizable()
//                .frame(width: 100, height: 100)
                .clipShape(
                    RoundedRectangle(cornerRadius: 19)
                )
                .shadow(color: .white, radius: 3)
                .opacity(0.4)
            
            VStack(spacing:3){
                // Question 길이에 따라 카드 표시 형식 변경
                Text(self.questionTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                HStack(spacing: 3){
                    Image(systemName: "bubble.right")
                        .foregroundColor(Color.black)
                    Text(post.answerCount)
                        .foregroundColor(.black)
                }
                .padding(1)
//                .position(x:UIScreen.screenWidth/1.4-30,y:UIScreen.screenHeight/1.8-100)
                 //댓글 개수
            }
            
            Image(systemName: "arrow.up.backward.and.arrow.down.forward")
            .position(x: UIScreen.screenWidth/1.4-5 , y:20)
        }
        .frame(width: UIScreen.screenWidth/1.3, height: UIScreen.screenHeight/1.4, alignment: .center)
    }
}

struct AnswerCardView: View {
    
    @EnvironmentObject var viewModel: postViewModel
    @State var comment:String = ""
    @State var scailing: Bool = true
    @State var isLinkAlive: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("오늘의 질문")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.screenWidth * 0.9, height: 10, alignment: .center)
                    .padding(10)
                ScrollView(.horizontal){
                    HStack{
                        // ForEach Envirnoment object 넣어주기
                        ForEach(viewModel.postContents){
                            post in
                            let postIndex = Int(post.index) ?? 0
                            NavigationLink(destination: QuestionDetailView(index: postIndex-1)){
//                            NavigationLink(destination: QuestionDetailView(index: postIndex-1), isActive: $isLinkAlive){
                                QuestionCard(post: post)
                            }
                        }
                    }
                }
                .padding(10)
            }.navigationTitle("질문 카드")
                .navigationBarHidden(true)
        }
    }
}

struct AnswerCardView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCardView()
            .previewInterfaceOrientation(.portrait)
        QuestionCard(post: postContentList[0])
    }
}
