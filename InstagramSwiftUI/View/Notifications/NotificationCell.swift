//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = false
    
    var body: some View {
        HStack {
            // Image
            Image("borek")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            // Caption
            Text("mati_borek")
                .font(.system(size: 14, weight: .semibold))
            +
            Text(" ")
            +
            Text("liked one of your posts.")
                .font(.system(size: 15))
            Spacer()
            
            if showPostImage {
                Image("natsu-post")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button {
                    print("DEBUG: go to postview")
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background { Color(.systemBlue) }
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
