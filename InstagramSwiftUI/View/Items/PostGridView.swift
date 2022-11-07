//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import Kingfisher
import SwiftUI

struct PostGridView: View {
    
    private let columns = Array(repeating: GridItem(), count: 3)
    private let width = UIScreen.main.bounds.width / 3
    
    let config: PostGridConfiguration
    
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 2) {
            ForEach(viewModel.posts) { post in
                NavigationLink {
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                } label: {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }

            }
        }
    }
}

//struct PostGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostGridView()
//    }
//}
