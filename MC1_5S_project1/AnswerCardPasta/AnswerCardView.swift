//
//  AnswerCardView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

struct QuestionCard: View {
    
    @State var post: PostContent
    
    var body: some View{
        ZStack
        {
            RoundedRectangle(cornerRadius: 19)
                .stroke(MINTCOLOR, lineWidth: 2)
            
            Text(post.title)
                .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .padding()
        }
        .frame(width: UIScreen.screenWidth/1.4, height: UIScreen.screenHeight/2.5, alignment: .center)
    }
}

struct AnswerCardView: View {
    
    @State var comment:String = ""
    @State var scailing: Bool = true
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(postContentList){
                            post in
                            let post_index = Int(post.index) ?? 0
                            NavigationLink(destination: QuestionDetailView(index: post_index-1)){
                                QuestionCard(post: post)
                            }
                        }
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 19)
                        .stroke(MINTCOLOR, lineWidth: 2)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2, alignment: .center)
                    TextField( "답변을 입력하세요", text: $comment)
                }
            }.navigationTitle("질문 카드")
        }
    }
}

struct AnswerCardView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCardView()
            .previewInterfaceOrientation(.portraitUpsideDown)
        QuestionCard(post: postContentList[0])
    }
}
