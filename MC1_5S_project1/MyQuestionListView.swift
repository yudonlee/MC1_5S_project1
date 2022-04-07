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
                Picker("what menu?", selection: $myMenu) {
                    Text("내 질문").tag(0)
                    Text("내 답변").tag(1)
                    Text("스크랩").tag(2)
                }
                .pickerStyle(.segmented)
                .padding()
                
                
//                List(0..<50){ index in
//                    Text("#익명\n sample data")
//                }
            }.navigationTitle("MY")
        }
    }
//    init() {
//        UITableView.appearance().backgroundColor = .white
//    }
}

struct MyQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        MyQuestionListView()
    }
}
