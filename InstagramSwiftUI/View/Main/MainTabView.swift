//
//  MainTabView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct MainTabView: View {
    
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .onTapGesture { selectedIndex = 0 }
                    .tag(0)
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .onTapGesture { selectedIndex = 1 }
                    .tag(1)
                UploadPostView(tabIndex: $selectedIndex)
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                    .onTapGesture { selectedIndex = 2 }
                    .tag(2)
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                    .onTapGesture { selectedIndex = 3 }
                    .tag(3)
                ProfileView(user: user)
                    .tabItem {
                        Image(systemName: "person")
                    }
                    .onTapGesture { selectedIndex = 4 }
                    .tag(4)
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    logoutButton
                }
            }
            .accentColor(.black)
        }
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            Text("Logout")
                .foregroundColor(.black)
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New Post"
        case 3: return "Notifications"
        case 4: return "Profile"
        default: return ""
        }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
