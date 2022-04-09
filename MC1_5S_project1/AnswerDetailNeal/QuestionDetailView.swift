//
//  QuestionDetailView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI


struct QuestionDetailView: View {
    //    @State private var postContent
    @State var mul: Double = 0.5
    @State var index: Int
    @State var scailing: Bool = true
    @State private var alsoQuestionable: Bool = false
    @State private var questionContent = "사진 촬영 동의시 부모님 서명이 필요한가요?"
    @State private var answerLists = ["아닙니다", "맞아요 같이 서명해서 제출하면 돼요", "좋아요!", "고마워요!"]
    @State private var nameLists = ["익명1", "익명2", "닐", "파스타"]
    @State private var anonymousCount: Int = 1
    
    
    @State private var answerTextField: String = ""
    
    
    private let placeholder = "답변을 입력하시오."
    @State private var userReplyText: String?
//    @Binding private var bindingTest: String = "Placeholder"
//    Binding keyword가 되지 않는 이유는?
    
    
    
    var body: some View {
        VStack(alignment: .center) {
            
//            문제1 스크롤할때 도형내부에서만 움직여야 하는데 도형밖으로 흩뿌려짐.
            ScrollView() {
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
                        Text("얄냐얼야러야ㅓㄹ야ㅓㄹ야ㅓㄹ야러냐러dfosdfidfidjisgjifjfigjdfigjrgjeorgijeroigjeriojogijefigjdfoigjdfoigjdfoigdfoigjdfoijgdoifjgidofjgfjfffgdfgfdjgnfjngdjfngjdfngjfngjdnfgjndfgjdfngjfngdkfjgndkfjgndfjn")
                        //ScrollView로 이것도 바꿔야하나??? 아니 이게 웹페이지라면 그냥 바로 할 수 있을것 같기도 한데!!
//                        Text("\(postContentList[index].title) ")
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                        
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
                    Spacer()
                    HStack {
                        Toggle(isOn: $alsoQuestionable)
                        {
                            Label("나도 궁금해요", systemImage: "checkmark.square")
                        }
                        .toggleStyle(.button)
                        Spacer()
                        if(postContentList[index].answerCountToInt > 0) {
                            Image(systemName: "bubble.right.fill")
                        } else {
                            Image(systemName: "bubble.right")
                        }
                        Text(postContentList[index].answerCount)
                        
                    }
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 10))
                    
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.2, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 19)
                        .stroke(appMainColor, lineWidth: 1)
                )

            
            
            /*
            RoundedRectangle(cornerRadius: 19)
                .stroke(appMainColor, lineWidth: 1)
                .frame(width: UIScreen.screenWidth * 0.95, height: 200, alignment: .center)
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
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                            
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
                        Spacer()
                        HStack {
                            Toggle(isOn: $alsoQuestionable)
                            {
                                Label("나도 궁금해요", systemImage: "checkmark.square")
                            }
                            .toggleStyle(.button)
                            Spacer()
                            if(postContentList[index].answerCountToInt > 0) {
                                Image(systemName: "bubble.right.fill")
                            } else {
                                Image(systemName: "bubble.right")
                            }
                            Text(postContentList[index].answerCount)
                            
                        }
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 10))
                        
                        
                    }
                    , alignment: .top)
            
            */
            
            
            
            Spacer()
            
            VStack {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(postContentList[index].answer){ answer in
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
                            
//                            Divider에서 마지막 line을 없도록 만들기!
//                            마지막 last id에 적용하지 않도록 하기
//                            여기서 왜 에러가 나는 걸까?
//                            Text(postContentList[index].lastAnswerName)
                            if(answer.name != postContentList[index].lastAnswerName) {
                                Divider()
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                    } // VStack
                } // ScrollView
                
            // 더보기 버튼

            }
            // border
            .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal, 15)
            
//            List Content
            /*
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
                    .padding()
                    .border(appMainColor, width: 4)
                    .cornerRadius(19)
                    
                }
            }
            .listStyle(InsetGroupedListStyle())
            .onAppear() {
                UITableView.appearance().backgroundColor = .clear
            }
            */
            
            HStack {
                Text("답변하기")
                    .font(.title)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                Spacer()
                Button("완료") {
                    print("complete")
                    print(userReplyText ?? "")
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
//                        ScrollView(.vertical){
                            HStack(alignment: .top) {
                            
//                                TextField("답변을 입력하시오", text: $answerTextField)
//                                    .multilineTextAlignment(.leading)
//                                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                                
                                
//                                ZStack(alignment: .topLeading) {
//                                    Text(userReplyText ?? placeholder)
//                                        .padding()
//                                        .opacity(userReplyText == nil ? 1 : 0)

//                                    TextEditor(text: Binding($userReplyText, replacingNilWith: ""))
//                                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
//                                        .multilineTextAlignment(.leading)
//                                    Binding하지 않으면, Cannot convert value of type 'Binding<String?>' to expected argument type 'Binding<String>가 뜨게 되는데 이는 core data value가 optional이기 때문이다!
//
//                                    TextEditor(text: Binding($userReplyText, replacingNilWith: ""))
//                                }
                                TextEditor(text: $answerTextField)
                                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                                    .multilineTextAlignment(.leading)

                                Button(action: {
                                    print("scaling")
                                    if(scailing) {
                                        mul *= 2
                                    } else {
                                        mul /= 2
                                    }
                                    scailing = !(scailing)
                                }){
                                    if(scailing) {
                                        Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                    } else {
                                        Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                    }
                                    
                                }
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
//                            }
                        }
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        , alignment: .top)
                        
            }

        }
    }
}


//이떄 where은 type을 나타낸다.
public extension Binding where Value: Equatable {
    init(_ source: Binding<Value?>, replacingNilWith nilProxy: Value) {
        self.init(
            get: { source.wrappedValue ?? nilProxy },
            set: { newValue in
                if newValue == nilProxy {
                    source.wrappedValue = nil
                } else {
                    source.wrappedValue = newValue
                }
                                    
            }
        )
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(index: 4)
    }
}
