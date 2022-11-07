//
//  CommentCell.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import Kingfisher
import SwiftUI

struct CommentCell: View {
    let comment: Comment
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            Text(comment.username)
                .font(.system(size: 13, weight: .semibold))
            +
            Text(" ")
            +
            Text(comment.commentText)
                .font(.system(size: 14))
            
            Spacer()
            
            Text(comment.timestamp.asAbbreviatedString())
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        .padding(.horizontal)
    }
    
    
}

//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell()
//            .padding()
//            .previewLayout(.sizeThatFits)
//    }
//}
