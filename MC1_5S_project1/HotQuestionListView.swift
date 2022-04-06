//
//  HotQuestionListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
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
//struct ButtonToLists : View {
//    var body : some View {
//
//    }
//}
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
                //SelectedHotPage
                Picker("", selection: $myMenu) {
                    Text("Hot").tag(0)
                    Text("New").tag(1)
                }.pickerStyle(.segmented).frame(width: 300, alignment: .center)
                
                    .frame(height:40)
                    .searchable(text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=$text@*/.constant("")/*@END_MENU_TOKEN@*/, placement: /*@START_MENU_TOKEN@*/.toolbar/*@END_MENU_TOKEN@*/)
                List (0..<30) {_ in
                    examplesQuestions()
                }
                //                .frame(width: 300, height: 600)
                //                .padding(15)
                //            .offset(x: -35.0, y: -50.0)
                //                .border(Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2)
                //                .cornerRadius(19.0)
                
                
                
                //            .frame(width: 350)
            }
        }
    }
}

struct HotQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        HotQuestionListView()
    }
}
