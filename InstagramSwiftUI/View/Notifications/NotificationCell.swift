//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import Kingfisher
import SwiftUI

struct NotificationCell: View {
    
    @StateObject private var viewModel: NoticifationCellViewModel
    @State private var showPostImage = false
    
    var isFollowed: Bool {
        return viewModel.notification.userIsFollowed ?? false
    }
    
    init(notification: Notification) {
        _viewModel = StateObject(wrappedValue: NoticifationCellViewModel(notification: notification))
    }
    
    var body: some View {
        HStack {
            
            if let user = viewModel.notification.user {
                NavigationLink {
                    ProfileView(user: user)
                } label: {
                    // Image
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    // Caption
                    Text(viewModel.notification.username)
                        .font(.system(size: 14, weight: .semibold))
                    +
                    Text(" ")
                    +
                    Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size: 15))
                }

            }

            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink {
                        FeedCell(viewModel: FeedCellViewModel(post: post))
                    } label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                }
            } else {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background { isFollowed ? Color.white : Color.blue }
                        .cornerRadius(5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    Color.gray,
                                    lineWidth: isFollowed ? 1 : 0
                                )
                        }
                }

            }
        }
        .padding(.horizontal)
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//    }
//}
