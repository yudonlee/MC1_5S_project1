//
//  CompletAnswerListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//


// What i have to do
// sticky bar? navigation section header가 고정된채 스크롤이 됐으면 좋겠음
//

import SwiftUI

let appMainColor = Color.init(red: 48/255,
                              green: 176/255,
                              blue: 199/255)
let appPointColor = Color.init(red: 1, green: 204/255, blue: 0)

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "M월 d일 hh시mm분"
    return formatter
}()

struct answerComment: Identifiable {
    let name: String
    let content: String
    let certified: Bool
    let isAnonymous: Bool
    let lastUpdateTime: Date
    var id: String { name }
}

let currentTime = Date()
let answerCommentList: [answerComment] = [
    answerComment(name: "익명1", content: "아닙니다", certified: false, isAnonymous: true, lastUpdateTime: Date()),
    answerComment(name: "익명2", content: "맞아요 같이 서명해서 제출하면 돼요", certified: false, isAnonymous: true, lastUpdateTime: Date()),
    answerComment(name: "닐", content: "좋아요! 맞습니다.", certified: false, isAnonymous: false, lastUpdateTime: Date()),
    answerComment(name: "파스타", content: "고마워요!", certified: false, isAnonymous: false, lastUpdateTime: Date())
    
]


struct CompletAnswerListView: View {
    @State private var questionContent = "사진 촬영 동의시 부모님 서명이 필요한가요?"
    @State private var answerLists = ["아닙니다", "맞아요 같이 서명해서 제출하면 돼요", "좋아요!", "고마워요!"]
    @State private var nameLists = ["익명1", "익명2", "닐", "파스타"]
    @State private var anonymousCount: Int = 1
        
    
    var body: some View {
       
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 19)
                .stroke(appMainColor, lineWidth: 1)
                .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.25, alignment: .center)
                .overlay(
                    HStack(alignment: .top){
                        Text("Q.")
                            .foregroundColor(appMainColor)
                            .fontWeight(.bold)
                        Text("\(questionContent)")
                            .multilineTextAlignment(.leading)
                        
                    }
                )
            
            
            
            
            
            Spacer()
            
            List {
                Section(header: HStack{
                    Text("답변들")
                    Image(systemName: "flame.fill")
                }
                    .foregroundColor(appMainColor)
                    .font(.headline)
                        
                )
                {
                    
                    ForEach(answerCommentList) { answer  in
                        VStack(alignment:.leading) {
                            HStack{
                                Image(systemName: "applelogo")
//                                Image(systemName: "lev\()")
                                Text(answer.name)
                                
                                Spacer()
                                Button("수정") {
                                    print("수정")
                                }
                                Button("삭제") {
                                    print("delete")
                                }
                            }
                            Text("\(answer.content)")
                                .frame(height: 50)
                            Text(dateFormatter.string(from: answer.lastUpdateTime))
                                .frame(alignment: .leading)
                        }
                    }
                    
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            HStack(alignment: .center){
                
                Button("수정"){
                    print("s")
                }
                .font(.title)
                .padding(7)
                .foregroundColor(.white)
                .background(
                    appMainColor
                )
                .cornerRadius(19)
                //                Spacer()
                Button("삭제"){
                    print("s")
                }
                .font(.title)
                .padding(7)
                .foregroundColor(.white)
                .background(
                    appMainColor
                )
                .cornerRadius(19)
                
            }
            
        }
        
        
    }
}


extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct CompletAnswerListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CompletAnswerListView()
        }
    }
}
