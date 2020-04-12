//
//  DetailViewInterface.swift
//  Sweatworks
//
//  Created by Ronit on 4/10/20.
//  Copyright © 2020 Ronit. All rights reserved.
//

import SwiftUI

struct DetailViewInterface: UIViewControllerRepresentable {
    var selectedUser: User?
    
    func makeUIViewController(context: Context) -> UIViewController {
        let detailVC = DetailViewController()
        detailVC.firstName = selectedUser?.firstName
        detailVC.lastName = selectedUser?.lastName
        detailVC.address = selectedUser?.address
        detailVC.imageUrl = selectedUser?.imageUrl
        return detailVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
