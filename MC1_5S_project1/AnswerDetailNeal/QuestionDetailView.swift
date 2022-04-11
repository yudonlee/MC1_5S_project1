//
//  QuestionDetailView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI


struct QuestionDetailView: View {
    @State var index: Int
    @State var mul: Double = 0.5
    
    @State var scailing: Bool = true
    @State private var alsoQuestionable: Bool = false
    
    @State private var answerTextField: String = ""
    @State private var anonymousCount:Int = 1
    
    private let placeholder = "답변을 입력하시오."
    @State private var userReplyText: String?
    
    
//    what is Focus State?
//    property wrappers의 도입배경
    @FocusState var isInputActive: Bool
    
    //    @Binding private var bindingTest: String = "Placeholder"
    //    Binding keyword가 되지 않는 이유는?
    
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            //            문제1 스크롤할때 도형내부에서만 움직여야 하는데 도형밖으로 흩뿌려짐.
            //            padding EdgeInsets을 통해 해결함.
            
            ScrollView() {
                VStack{
                    HStack(alignment: .top) {
                        Image(systemName: "applelogo")
                        if postContentList[index].isAnonymous {
                            Text("익명\(anonymousCount)")
                        } else {
                           Text(postContentList[index].name)
                        }
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
                        Image(systemName: "bubble.right")
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
            
            
            
            
            
            Spacer()
            
            
            VStack {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(postContentList[index].answer){ answer in
                            VStack(alignment:.leading) {
                                HStack{
                                    Image(systemName: "applelogo")
                                    if answer.isAnonymous {
                                        Text("익명")
                                    } else {
                                        Text(answer.name)
                                    }
                                    
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
//                                Text(dateFormatter.string(from: Date()))
//                                    .frame(alignment: .leading)
//                                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                                Text(dateFormatter.string(from: answer.created_at))
                                    .frame(alignment: .leading)
                                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                            }
                            
                            //                           Divider가 List elements들 사이에만 존재하도록 코드 수정
                            if(answer.name != postContentList[index].lastAnswerName) {
                                Divider()
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                    } // VStack
                } // ScrollView
                
            }
            // border
            .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            // horizontal을 적용한 이유를 모름.
            .padding(.horizontal, 15)
            
             
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
                    .stroke(appMainColor, lineWidth: 1)
                    .frame(width: UIScreen.screenWidth * (2.5 / 3), height: UIScreen.screenHeight * 0.25 * mul, alignment: .center)
                    .overlay(
                        
                        
                        HStack(alignment: .top) {
                            //                                처음에 Rectangle에 Scrollview를 overlay했으나, TextField도 자동으로 스크롤이 생겨 두개의 스크롤이 생겼다
                            //                                또한 ScrollView가 TextField의 Scroll을 따라가지 못해, 도형에 적용된 ScrollView삭제하니 정상작동.
                            TextEditor(text: $answerTextField)
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                                .multilineTextAlignment(.leading)
//                           keyboard dimiss하기 위한 방법
                                .focused($isInputActive)
                                .toolbar {
                                    ToolbarItem(placement: .keyboard) {
                                        Button("Done") {
                                            isInputActive = false
                                        }
                                        Spacer()
                                        Button(action: { print("image Button") } ) {
                                            Image("camera.circle")
                                                .imageScale(.medium)
                                        }
                                    }
                                    
                                }
                            
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
