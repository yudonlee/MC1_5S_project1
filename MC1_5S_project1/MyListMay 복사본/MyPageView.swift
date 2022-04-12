//
//  MyPageView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/08.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack {
            MyProfileView()
            MyListPickerView()
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
