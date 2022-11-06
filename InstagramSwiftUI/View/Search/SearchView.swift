//
//  SearchView.swift
//  InstagramSwiftUI
//
//  Created by Tomasz Ogrodowski on 04/11/2022.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var inSearchMode = false
    
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            ZStack {
                if inSearchMode {
                    // List of searched users
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    // Grid of recommended posts
                    PostGridView(config: .explore)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
