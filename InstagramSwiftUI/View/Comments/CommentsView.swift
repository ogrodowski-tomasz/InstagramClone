//
//  CommentsView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import SwiftUI

struct CommentsView: View {
    
    @State private var commentText = ""
    @StateObject private var viewModel: CommentViewModel
    
    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: CommentViewModel(post: post))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }
            .padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    private func uploadComment() {
        viewModel.uploadComments(commentText: commentText)
        commentText = ""
    }
}

//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView()
//    }
//}
