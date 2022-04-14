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

var ansArr: [Int] = []

func isInAnsArray(value: Int) -> Bool { //ansArr 내에 value가 있는지 검사, 없으면 삽입
    if ansArr.contains(value) {
        return true
    } else {
        ansArr.insert(value,at:0)
        return false
    }
}

struct MyAnswerListView: View {
    @EnvironmentObject var viewModel: postViewModel
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
                VStack(spacing: 15) {
                    ForEach(viewModel.postContents){ post in
                        ForEach(post.answer.filter{
                            $0.name == UserInformation.loginUser.name
                        }) { item in
                            let postIdx = Int(post.index) ?? 0
                            
                            //return이 왜 안되냐고...
                            
                            NavigationLink(destination: QuestionDetailView(index: postIdx-1)){
//                                MyAnswerContentView(postIdx: postIdx-1,
//                                                    isIn: isInAnsArray(value: postIdx-1))
                                
                                MyContentView(postIdx: postIdx-1)
//                                MyContentView(post: post)
                            }.navigationBarTitleDisplayMode(.inline)
                            Divider()
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                } //Vstack
                
            } //ScrollView
        }.overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}

struct MyAnswerContentView: View { // 질문 게시글 리스트
    @EnvironmentObject var viewModel: postViewModel

    @State var postIdx: Int
//    @State var isIn: Bool
    
    var body: some View {
//    -> {
//        if !isIn {
            return HStack {
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
//        }
    }
}

struct MyAnswerListView_Previews: PreviewProvider {
    static var previews: some View {
        MyAnswerListView()
    }
}

