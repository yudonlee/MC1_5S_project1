//
//  MyProfileView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/08.
//

import SwiftUI

struct MyProfileView: View {
    @State private var showNoti = false
    
    var body: some View {
//        NavigationView {
            VStack {
                HStack { //프로필 아이콘, 레벨, 닉네임
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

                    HStack (alignment: .top) { //검색,알림 버튼
        //                Button(action: { //검색 버튼
        //                    print("검색")
        //                }){
        //                    Image(systemName: "magnifyingglass")
        //                }
        //                .font(.system(size: 20))
        //                .foregroundColor(.black)

                        Button(action: { //알림 버튼
                            print("알림")
                            self.showNoti = true
                        }){
                            Image(systemName: "bell.fill")
                        }
                        .sheet(isPresented: self.$showNoti) {
                            NotiView()
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(.trailing)
                    }
                }.padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 10))
                    .background(Color.mint)
            }
//            .navigationBarTitle("") .navigationBarHidden(true)
//        }
//        .toolbar {
//            if searching {
//                Button("Cancel") {
//                    searchText = ""
//                    withAnimation {
//                        searching = false
//                        UIApplication.shared.dismissKeyboard()
//                    }
//                }
//            }
//        }
    }
}

struct NotiView: View { //알림 버튼 클릭 시 보이는 modal view
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Group {
            Text("알림 화면")
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "clear")
            }
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}