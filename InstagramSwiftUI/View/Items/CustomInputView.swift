//
//  CustomInputView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            // Divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            // Stack with text field and button
            HStack {
                TextField("Comments", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.bottom, 8)
        .padding(.horizontal)
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(inputText: .constant(""), action: { } )
    }
}
