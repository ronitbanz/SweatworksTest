//
//  SearchBarView.swift
//  Sweatworks
//
//  Created by Ronit Banze on 2020-04-10.
//  Copyright © 2020 Ronit. All rights reserved.
//

import SwiftUI

struct SearchBarView : UIViewRepresentable {
    
    @Binding var text: String
    var searchTriggered: (() -> Void)? = nil
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        let control: SearchBarView
        
        init(_ control: SearchBarView) {
            self.control = control
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            control.text = searchText
            control.searchTriggered?()
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBarView>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = NSLocalizedString("Search", comment: "")
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBarView>) {
        uiView.text = text
    }
    
}
