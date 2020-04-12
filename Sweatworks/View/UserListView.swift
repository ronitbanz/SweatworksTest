//
//  UserListView.swift
//  Sweatworks
//
//  Created by Ronit Banze on 2020-04-12.
//  Copyright © 2020 Ronit. All rights reserved.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var userViewModel = UserListViewModel()
    @State private var searchText : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText, searchTriggered: filter)
                List(userViewModel.users){i in
                    NavigationLink(
                    destination: DetailViewInterface(selectedUser: i).navigationBarTitle((Text("User Details")))) {
                        UserListRow(user: i)
                    }
                }.id(UUID())
            }.navigationBarTitle("User List", displayMode: .inline)
        }.onAppear(perform: search)
    }
    
    private func search() {
        userViewModel.search()
    }
    
    private func filter() {
        userViewModel.filter(forQuery: searchText)
    }
}
