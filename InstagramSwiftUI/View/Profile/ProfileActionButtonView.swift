//
//  ProfileActionButtonView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    var isCurrentUser = false
    @State private var isFollowed = false
    
    var body: some View {
        if isCurrentUser {
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 340, height: 32)
                    .foregroundColor(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
        } else {
            HStack {
                Button {
                    isFollowed.toggle()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background { isFollowed ? Color.white : Color.blue }
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(
                                    Color.gray,
                                    lineWidth: isFollowed ? 1 : 0
                                )
                        }
                }
                .cornerRadius(3)
                Button {
                    
                } label: {
                    Text("Message")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }
            }
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView()
    }
}
