//
//  MyProfileView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/08.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
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
                Button(action: { //검색 버튼
                    print("검색")
                }){
                    Image(systemName: "magnifyingglass")
                }
                .font(.system(size: 20))
                .foregroundColor(.black)

                Button(action: { //알림 버튼
                    print("알림")
                }){
                    Image(systemName: "bell.fill")
                }
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding(.leading)
            }


        }.padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 10))
            .background(Color.mint)
        
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
