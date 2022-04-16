//
//  MyProfileView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/08.
//

import SwiftUI

struct MyProfileView: View {
    @State private var showNoti = false
    
    @EnvironmentObject var viewModel: postViewModel

    
    var body: some View {
            VStack {
                HStack { //프로필 아이콘, 레벨, 닉네임
                    let userLevel = UserInformation.loginUser.level ?? 0
                    
                    Image("lev\(userLevel)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    VStack (alignment: .leading, spacing: 10){
                        if userLevel == 4 {
                            Text("Certified")
                        } else {
                            Text("LV." + String(userLevel))
                        }
                        Text(UserInformation.loginUser.name ?? "")
//                        Text(user.level)
//                        Text(user.name)
                    }
                    Spacer()

                    HStack (alignment: .top) {
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
    }
}

struct NotiView: View { //알림 버튼 클릭 시 보이는 modal view
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Group {
            Text("Notifications")
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
