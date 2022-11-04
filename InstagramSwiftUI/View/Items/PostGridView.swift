//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct PostGridView: View {
    
    private let columns = Array(repeating: GridItem(), count: 3)
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 2) {
            ForEach(0..<10) { _ in
                NavigationLink {
                    FeedView()
                } label: {
                    Image("borek-post")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }

            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
