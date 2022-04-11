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
//                Text("질문 카드")
//                    .font(.system(size: 15, design: .default))
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
//                ZStack{
                TextEditor(text: $comment)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .multilineTextAlignment(.leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 19)
                            .stroke(MINTCOLOR, lineWidth: 2)
                            .frame(width: UIScreen.screenWidth*0.95, height: UIScreen.screenHeight/2, alignment: .center)
                    )
//                }
            }.navigationBarTitle("질문 카드").navigationBarHidden(true)
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
