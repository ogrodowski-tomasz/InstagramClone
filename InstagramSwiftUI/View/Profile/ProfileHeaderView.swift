//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import Kingfisher
import SwiftUI

struct ProfileHeaderView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Posts")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                }
                .padding(.trailing, 16)
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding(.leading)
                .padding(.top, 3)
            
            if let bio = viewModel.user.bio {
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top, 1)
            }
            
            HStack {
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}



//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
