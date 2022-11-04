//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Post author info
            HStack {
                Image("natsu")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .cornerRadius(18)
                    .clipped()
                Text("natalia.karczmarczyk")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            // Posted image
            
            Image("natsu-post")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 400)
                .clipped()
            
            // Action buttons
            
            HStack(spacing: 15) {
                Button {
                    print("DEBUG: Liked post")
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    print("DEBUG: Comment post")
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    print("DEBUG: Shared post")
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            // Post parameters
            Text("2345 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            // caption
            
            HStack {
                Text("natalia.karczmarczyk")
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(" ")
                +
                Text("Hejka kochani! Już jutro nowy odcinek Natsu World!")
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            // Date
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
        
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
