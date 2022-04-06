//
//  MyQuestionListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI

struct MyQuestionListView: View {
    @State private var MaterialType = 0
    var body: some View {
        List {
            Text("#익명\n sample data")
            Text("#익명\n sample data")
            Text("#익명\n sample data")
            Text("#익명\n sample data")
            Text("#익명\n sample data")
            Text("#익명\n sample data")
            Text("#익명\n sample data")
            Text("#익명\n sample data")
            Text("#익명\n sample data")
            Text("#익명\n sample data")
        }
    }
}

struct MyQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        MyQuestionListView()
    }
}
