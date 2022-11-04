//
//  RegistrationView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State private var imagePickerPresented = false
    
    @Environment(\.dismiss) var dismiss
    
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
                if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                } else {
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        Image("plus_photo")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedImage)
                    })
                }
                
                VStack(spacing: 20) {
                    // email field
                    CustomTextField(text: $email, placeholder: Text("Email"), systemImageName: "envelope")
                        .padding()
                        .background { Color(.init(white: 1, alpha: 0.15)) }
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    // username field
                    CustomTextField(text: $username, placeholder: Text("Username"), systemImageName: "person")
                        .padding()
                        .background { Color(.init(white: 1, alpha: 0.15)) }
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    // Full Name field
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), systemImageName: "person")
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
                
                // Sign up
                Button {
                    
                } label: {
                    Text("Sign Up")
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
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
