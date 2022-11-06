//
//  UploadPostView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State private var imagePickerPresented = false
    
    @Binding var tabIndex: Int
    
    @StateObject private var viewModel = UploadViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    
//                    TextField("Enter caption...", text: $captionText)
                    TextArea(text: $captionText, placeholder: "Enter Your Caption...")
                        .frame(height: 200)
                }
                .padding()
                
                HStack {
                    Button {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                withAnimation {
                                    captionText = ""
                                    postImage = nil
                                    tabIndex = 0
                                }
                            }
                        }
                    } label: {
                        Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background { Color.blue }
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        captionText = ""
                        postImage = nil
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background { Color.gray.opacity(0.15) }
                            .cornerRadius(5)
                            .foregroundColor(.red)
                    }
                }
                .padding()
                
            }
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
