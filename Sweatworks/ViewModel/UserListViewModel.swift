//
//  UserListViewModel.swift
//  Sweatworks
//
//  Created by Ronit on 4/10/20.
//  Copyright © 2020 Ronit. All rights reserved.
//

class UserListViewModel: ObservableObject, UserAPIClientDelegate {
    
    @Published var users = [User]()
    var sortedUsers = [User]()
    
    func search() {
        let client =  UserAPIClient()
        client.delegate = self
        client.getUsers()
    }
    
    func filter(forQuery searchQuery: String) {
        users = sortedUsers
        if searchQuery.count > 2 {
            users = users.filter{ ($0.lastName!.lowercased().range(of:searchQuery.lowercased()) != nil)}
        }
    }
    
    func userAPIClient(_ client: UserAPIClient!, didReceiveUsers usersList: Any!) {
        if let savedUsers = UserDefaults.standard.object(forKey: "users") as? Data {
            let decoder = JSONDecoder()
            if let loadedUsers = try? decoder.decode([User].self, from: savedUsers) {
                sortedUsers.append(contentsOf: loadedUsers)
            }
        }
        
        if let resultList = usersList! as? [String:Any] {
            if let results = resultList["results"] as? [[String:Any]] {
                for result in results {
                    let user = User(dictionary: result)
                    sortedUsers.append(user)
                }
            }
        }
        
        sortedUsers = sortedUsers.sorted { $0.lastName! < $1.lastName! }
        users = sortedUsers
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(users) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "users")
        }
    }
    
    func userAPIClient(_ client: UserAPIClient!, didFailWithError error: Error!) {
        if let savedUsers = UserDefaults.standard.object(forKey: "users") as? Data {
            let decoder = JSONDecoder()
            if let loadedUsers = try? decoder.decode([User].self, from: savedUsers) {
                sortedUsers.append(contentsOf: loadedUsers)
            }
        }
        users = sortedUsers
    }
}
