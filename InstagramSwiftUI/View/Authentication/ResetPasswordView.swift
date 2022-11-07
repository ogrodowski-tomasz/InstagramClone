//
//  ResetPasswordView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    @Binding var email: String
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.purple,
                    Color.blue
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                VStack(spacing: 20) {
                    // email field
                    CustomTextField(text: $email, placeholder: Text("Email"), systemImageName: "envelope")
                        .padding()
                        .background { Color(.init(white: 1, alpha: 0.15)) }
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                }
                
                // Sign in
                Button {
                    viewModel.resetPassword(withEmail: email)
                } label: {
                    Text("Send Reset Password link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background { Color.instagramPurple }
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()

                // Go to sign up
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom, 32)
            }
            .padding(.top, 50)
        }
        .onReceive(viewModel.$didSendResetPasswordLink) { _ in
            self.dismiss()
        }
    }
}

//struct ResetPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetPasswordView()
//    }
//}
