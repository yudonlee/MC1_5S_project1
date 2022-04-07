//
//  ContentView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

struct ContentView: View {
    var postContents: [PostContent]
    var body: some View {
        List {
            ForEach(postContents) { post in
                Text(post.title)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(postContents: postContentList)
    }
}
