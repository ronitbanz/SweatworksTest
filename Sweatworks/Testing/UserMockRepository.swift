//
//  UserMockRepository.swift
//  Sweatworks
//
//  Created by Ronit Banze on 2020-04-11.
//  Copyright © 2020 Ronit. All rights reserved.
//

import Foundation

class UserMockRepository: UserRepositoryProtocol {
    
    init() {
        
    }
    
    var usersList: [User] = []
    
    func addUser(dictionary: [String: Any]) {
        usersList.append(User(dictionary: dictionary))
    }
    
    func getUsers() -> [User] {
        return usersList
    }
    
}
