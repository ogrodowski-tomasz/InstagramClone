//
//  TextArea.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 06/11/2022.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
        }
        .font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea(text: .constant(""), placeholder: "Add bio...")
    }
}
