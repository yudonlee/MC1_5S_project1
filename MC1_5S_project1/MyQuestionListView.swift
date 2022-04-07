//
//  MyQuestionListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI

struct MyQuestionListView: View {
    @State private var myMenu = 0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("apple")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    VStack (alignment: .leading, spacing: 10){
                        Text("LV.1")
                        Text("오감이")
                    }
                    Spacer()
                    
                    
                }.padding()
                
                Picker("what menu?", selection: $myMenu) {
                    Text("내 질문").tag(0)
                    Text("내 답변").tag(1)
                    Text("스크랩").tag(2)
                }
                .pickerStyle(.segmented)
                .padding()
                
                
                List(questionLists){ list in
                    QuestionView(list: list)
                }
            }
        }
    }
//    init() {
//        UITableView.appearance().backgroundColor = .white
//    }
}

let questionLists = [
    QuestionList(name: "익명", title: "사진 촬영 동의서 부모님 서명 필요한가요?", answerCount: "0"),
    QuestionList(name: "익명", title: "오늘 점심은 다들 뭐 드시나요?", answerCount: "10"),
    QuestionList(name: "익명", title: "기숙사에 택배 부쳐도 되나요?", answerCount: "3"),
    QuestionList(name: "익명", title: "미로에서 코멘트 어떻게 남기나요?", answerCount: "0"),
    QuestionList(name: "오감이", title: "프로젝트 하는데 너무 힘들어요ㅠㅠ 다들 어떻게 진행하시나요?", answerCount: "1")
]

struct QuestionList: Identifiable {
    let id = UUID()
    let name: String
    let title: String
    let answerCount: String
}

struct QuestionView: View { //리스트 항목별 화면 구성
    var list: QuestionList
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(list.name)
                Text(list.title)
                    .bold()
            }
            Spacer()
            Text("("+list.answerCount+")")
        }
    }
}

struct MyQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        MyQuestionListView()
    }
}
