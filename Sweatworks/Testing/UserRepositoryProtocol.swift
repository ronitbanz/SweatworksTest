//
//  UserRepositoryProtocol.swift
//  Sweatworks
//
//  Created by Ronit Banze on 2020-04-11.
//  Copyright © 2020 Ronit. All rights reserved.
//

import Foundation

protocol UserRepositoryProtocol {
    func addUser(dictionary: [String: Any])
    func getUsers() -> [User]
}
