//
//  HotQuestionListView.swift
//  MC1_5S_project1
//
//  Created by Keily on 2022/04/06.
//

import SwiftUI

// examples_QnA
struct examplesQuestions : View {
    var body: some View {
        Text ("@Keily\n출입증은 어디서 수령하나요?")
            .font(.system(size:15))
    }
}
// SwitchOnBest
struct ButtonToAsk : View {
    var body : some View {
        Button(action: {
        }){
            Text("icon")
                .fontWeight(.bold)
        }
    }
}
//RoundedRectangle(cornerRadius: 19)
//    .stroke(Color.gray, lineWidth: 1.5)
//    .frame(width: 350, height: 600)
struct HotQuestionListView: View {
    @State private var myMenu = 0
    init() {
        UITableView.appearance().backgroundColor = .white
    }
    // items in RoundedRectangle...
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                //SelectHotOrNew
                HStack{
                    Picker("", selection: $myMenu) {
                        Text("Hot").tag(0)
                        Text("New").tag(1)
                    }
                    .frame(width: 250, height:40)
                    .pickerStyle(.segmented)
                    .offset(x: -23)
                    ButtonToAsk()
                }
            
                List (0..<30) {_ in
                    examplesQuestions()
                }.searchable(text: /*@PLACEHOLDER=$text@*/.constant("")/*@END_MENU_TOKEN@*/, placement: /*@START_MENU_TOKEN@*/.automatic)
            }
        }
    }
}

struct HotQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        HotQuestionListView()
    }
}
