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
    
    init(post:PostContent, maxLength:Int = 200) {
        self.maxLength = maxLength
        if post.title.count <= maxLength {
            self.questionTitle = post.title
        }else{
            let start = post.title.index(after: post.title.startIndex)
            let end = post.title.index(post.title.startIndex, offsetBy: self.maxLength)
            self.questionTitle = String(post.title[start...end]+"\n...")
        }
        self.post = post
    //        self.post = post
    }
    
    
    var body: some View{
        ZStack
        {
            RoundedRectangle(cornerRadius: 19)
                .stroke(MINTCOLOR, lineWidth: 2)
            VStack(spacing:3){
                // Question 길이에 따라 카드 표시 형식 변경
                Text(self.questionTitle)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                HStack(spacing: 3){
                    Image(systemName: "bubble.right")
                    Text(post.answerCount)
                }
                .padding(1)
//                .position(x:UIScreen.screenWidth/1.4-30,y:UIScreen.screenHeight/1.8-100)
                 //댓글 개수
            }
            
            Image(systemName: "arrow.up.backward.and.arrow.down.forward")
            .position(x: UIScreen.screenWidth/1.4-20 , y:20)
        }
        .frame(width: UIScreen.screenWidth/1.4, height: UIScreen.screenHeight/1.8, alignment: .center)
    }
}

struct AnswerCardView: View {
    
    @State var comment:String = ""
    @State var scailing: Bool = true
    @State var isLinkAlive: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("질문카드")
                    .bold()
                    .frame(width: UIScreen.screenWidth * 0.9, height: 10, alignment: .center)
                    .padding(10)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(postContentList){
                            post in
                            let post_index = Int(post.index) ?? 0
                            NavigationLink(destination: QuestionDetailView(index: post_index-1), isActive: $isLinkAlive){
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
