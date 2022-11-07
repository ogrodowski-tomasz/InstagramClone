//
//  LoginView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject private var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
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
                        
                        // password field
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background { Color(.init(white: 1, alpha: 0.15)) }
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    // Forgot password
                    HStack {
                        Spacer()
                        NavigationLink {
                            ResetPasswordView(email: $email)
                                .navigationBarBackButtonHidden(true)
                                .environmentObject(viewModel)
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                    }
                    
                    // Sign in
                    Button {
                        viewModel.login(withEmail: email, password: password)
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background { Color.instagramPurple }
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()

                    // Go to sign up
                    NavigationLink(destination: {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                    })
                    .padding(.bottom, 32)
                }
                .padding(.top, 50)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
