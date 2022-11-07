//
//  ProfileView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    @StateObject private var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
        print("DEBUG: Initialized profile view for: \(user.fullname)")
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                PostGridView(config: .profile(user.id ?? ""))
            }
            .padding(.top)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
