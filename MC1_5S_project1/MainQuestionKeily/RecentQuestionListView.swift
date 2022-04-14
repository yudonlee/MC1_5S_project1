//
//  RecentQuestionListView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

struct RecentQuestionListView: View {
    @EnvironmentObject var viewModel: postViewModel
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    ForEach(viewModel.postContents.reversed()) {
                        //새로 올라온 게시글부터 보여준다. reversed()
                        post in
                        let postIdx = Int(post.index) ?? 0 //string to int
                        NavigationLink(destination: QuestionDetailView(index: postIdx-1)){
                            MyContentView(postIdx: postIdx - 1)
                        }
                        Divider()
                    }
                }
                .padding(.all, 15)
            }
            // border
            .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding([.leading, .bottom, .trailing], 15)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct RecentQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentQuestionListView()
    }
}
