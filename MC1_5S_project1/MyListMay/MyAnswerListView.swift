//
//  MyAnswerListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/10.
//

import SwiftUI

//var ansSet: Set<Int> = []
//
//func isInAnsArray(value: Int) -> Bool {
//    ansSet.insert(value)
//    if ansSet.contains(value){
//        return true
//    }
//    return false
//}

var ansSet: [Int] = []

func isInAnsArray(value: Int) -> Bool {
    if ansSet.contains(value) {
        return true
    } else {
        ansSet.append(value)
        return false
    }
}

struct MyAnswerListView: View {
    @EnvironmentObject var viewModel: postViewModel
//    @State var ansSet: Set<Int> = []
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
                VStack(spacing: 15) {
                    ForEach(viewModel.postContents){ post in
                        ForEach(post.answer.filter{
                            $0.name == UserInformation.loginUser.name
                        }) { item in
                            let postIdx = Int(post.index) ?? 0
//                            $ansSet.insert(postIdx)
//                            ansSet.insert(postIdx)
                            
                            NavigationLink(destination: QuestionDetailView(index: postIdx-1)){
//                                MyAnswerContentView(postIdx: postIdx-1,
//                                                    isIn: isInAnsArray(value: postIdx-1))
                                MyContentView(postIdx: postIdx)
//                                MyContentView(post: post)
                            }.navigationBarTitleDisplayMode(.inline)
                            Divider()
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                    
//                    ForEach(viewModel.postContents.filter{ //연구 대상
//                        $0.name == UserInformation.loginUser.name
//                    }) { post in
//                        let post_index = Int(post.index) ?? 0
//
//                        //게시글 상세 이동
//                        NavigationLink(destination: QuestionDetailView(index: post_index-1)){
//                            MyAnswerContentView(post: post)
//                        }.navigationBarTitleDisplayMode(.inline)
//                        Divider()
//                    }
                } //Vstack
                
            } //ScrollView
        }.overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}

struct MyAnswerContentView: View { //질문 게시글 리스트
    @EnvironmentObject var viewModel: postViewModel

    @State var postIdx: Int
    @State var isIn: Bool
    
    var body: some View {
        if !isIn {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    if(viewModel.postContents[postIdx].isAnonymous){
                        Text("익명")
                            .bold()
                    } else {
                        Text(viewModel.postContents[postIdx].name) //작성자 닉네임
                            .bold()
                    }
                    Text(viewModel.postContents[postIdx].title) // 게시글 내용
    //                Text(postContentList[postIdx].title) //게시글 내용
                }
                Spacer()
                HStack(spacing: 3) {
                    Image(systemName: "bubble.right")
                    Text(viewModel.postContents[postIdx].answerCount)
    //                Text(postContentList[postIdx].answerCount) //댓글 개수
                }
                
            }//HStack
            .foregroundColor(.black)
                .multilineTextAlignment(.leading)
        }
    }
}

//struct MyAnswerContentView: View { //질문 게시글 리스트
//    @EnvironmentObject var viewModel: postViewModel
//
//    @State var post: PostContent
//    
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 10) {
//                if(post.isAnonymous){
//                    Text("익명")
//                        .bold()
//                } else {
//                    Text(post.name) //작성자 닉네임
//                        .bold()
//                }
//                Text(post.title) //게시글 내용
//            }
//            Spacer()
//            HStack(spacing: 3) {
//                Image(systemName: "bubble.right")
//                Text(post.answerCount) //댓글 개수
//            }
//        }.foregroundColor(.black)
//            .multilineTextAlignment(.leading)
//    }
//}


struct MyAnswerListView_Previews: PreviewProvider {
    static var previews: some View {
        MyAnswerListView()
    }
}

