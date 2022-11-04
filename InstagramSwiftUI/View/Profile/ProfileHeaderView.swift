//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("natsu")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 20, title: "Posts")
                    UserStatView(value: 1322, title: "Followers")
                    UserStatView(value: 112, title: "Following")
                }
                .padding(.trailing, 16)
            }
            
            Text("Natalia Karczmarczyk")
                .font(.system(size: 15, weight: .semibold))
                .padding(.leading)
                .padding(.top, 3)
            Text("Liderka TeamX2. Zawodniczka High League")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView()
                
                Spacer()
            }
            .padding(.top)
        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
