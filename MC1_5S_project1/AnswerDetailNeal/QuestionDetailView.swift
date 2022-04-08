//
//  QuestionDetailView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI


struct QuestionDetailView: View {
    //    @State private var postContent
    @State var mul: Double = 2.0
    @State var index: Int
    @State var scailing: Bool = true
    @State private var questionContent = "사진 촬영 동의시 부모님 서명이 필요한가요?"
    @State private var answerLists = ["아닙니다", "맞아요 같이 서명해서 제출하면 돼요", "좋아요!", "고마워요!"]
    @State private var nameLists = ["익명1", "익명2", "닐", "파스타"]
    @State private var anonymousCount: Int = 1
    
    
    var body: some View {
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 19)
                .stroke(appMainColor, lineWidth: 4)
                .frame(width: UIScreen.screenWidth, height: 200, alignment: .center)
                .overlay(
                    
                    VStack{
                        HStack(alignment: .top) {
                            
                            Image(systemName: "applelogo")
                            Text(postContentList[index].name)
                            Spacer()
                            Button("수정"){
                                print("s")
                            }
                            
                            Button("삭제"){
                                print("s")
                            }
                        }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                        HStack(alignment: .top){
                            Text("Q.")
                                .foregroundColor(appMainColor)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            //ScrollView로 이것도 바꿔야하나??? 아니 이게 웹페이지라면 그냥 바로 할 수 있을것 같기도 한데!!
                            Text("\(postContentList[index].title) ")
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
                            
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
                        
                        
                    }
                    , alignment: .top)
            
            
            
            
            
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
                    ForEach(postContentList[index].answer) { answer  in
                        VStack(alignment:.leading) {
                            HStack{
                                Image(systemName: "applelogo")
                                Text(answer.name)
                                
                                Spacer()
                                Button("수정") {
                                    print("수정")
                                }
                                Button("삭제") {
                                    print("delete")
                                }
                            }
                            Text("\(answer.contents)")
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                                .fixedSize(horizontal: false, vertical: true)
//                                .frame(height: 180)
                            Text(dateFormatter.string(from: Date()))
                                .frame(alignment: .leading)
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                        }
                    }
                    
                }
            }
            .listStyle(InsetGroupedListStyle())
            HStack {
                Text("답변하기")
                    .font(.title)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                Spacer()
                Button("완료") {
                    print("complete")
                }
                .padding(7)
                .foregroundColor(.white)
                .background(
                    appMainColor
                )
                .cornerRadius(19)
                
            }
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
            
            ZStack {
                RoundedRectangle(cornerRadius: 19)
                    .stroke(appMainColor, lineWidth: 4)
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.3 * mul, alignment: .center)
                RoundedRectangle(cornerRadius: 7)
                    .stroke(appMainColor, lineWidth: 4)
                    .frame(width: UIScreen.screenWidth * (2.5 / 3), height: UIScreen.screenHeight * 0.25 * mul, alignment: .center)
                    .overlay(
                        HStack {
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                            Button(action: {
                                print("scaling")
                                mul *= 2
                            }) {
                                if(scailing) {
                                    Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                } else {
                                    Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                }
                                
                            }
                        }
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        , alignment: .top)
                        
            }

        }
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(index: 4)
    }
}
