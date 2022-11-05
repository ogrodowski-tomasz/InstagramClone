//
//  MainTabView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
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
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
