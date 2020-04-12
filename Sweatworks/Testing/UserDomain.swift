//
//  UserDomain.swift
//  Sweatworks
//
//  Created by Ronit Banze on 2020-04-11.
//  Copyright © 2020 Ronit. All rights reserved.
//

import Foundation
class UserDomain {
    
    var userRemoteRepository: UserRepositoryProtocol?
    
    init(userRemoteRepository: UserRepositoryProtocol) {
        self.userRemoteRepository = userRemoteRepository
    }
    
    func addUser(dictionary: [String: Any]) {
        userRemoteRepository?.addUser(dictionary: dictionary)
    }
    
    func getUsers() -> [User]{
        return userRemoteRepository!.getUsers()
    }
    
}
