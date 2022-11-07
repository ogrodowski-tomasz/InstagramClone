//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 07/11/2022.
//

import SwiftUI

struct EditProfileView: View {
    
    @StateObject var viewModel: EditProfileViewModel
    @State private var bioText: String
    @Binding var user: User
    @Environment(\.dismiss) var dismiss
    
    init(user: Binding<User>) {
        self._user = user
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user.wrappedValue))
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    // dismiss
                    dismiss()
                } label: {
                    Text("Cancel")
                        .font(.system(size: 15, weight: .regular))
                        .padding(.top, 2)
                }
                Spacer()
                Text(viewModel.user.username)
                    .foregroundColor(.black)
                Spacer()
                Button {
                    // save and dismiss
                    viewModel.saveUserBio(bioText) {
                        self.dismiss()
                        self.user.bio = viewModel.user.bio
                    }
                } label: {
                    Text("✓ Done")
                        .font(.system(size: 14, weight: .bold))
                }
            }
            .padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(width: 370, height: 200)
                .padding()

            Spacer()
            
        }
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
