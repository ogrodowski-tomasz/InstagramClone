//
//  Extensions.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI
import UIKit


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Color {
    static var instagramPurple: Color {
        return Color(uiColor: UIColor(red: 190/255, green: 41/255, blue: 255/255, alpha: 100/255))
    }
}
