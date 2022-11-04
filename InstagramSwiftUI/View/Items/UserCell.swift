//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // Image
            Image("muran")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            // VStack -> username with fullname
            VStack(alignment: .leading) {
                Text("stary.muran")
                    .font(.system(size: 14, weight: .semibold))
                Text("Jacek Murański")
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
