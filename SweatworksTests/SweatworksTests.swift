//
//  SweatworksTests.swift
//  SweatworksTests
//
//  Created by Ronit on 4/9/20.
//  Copyright © 2020 Ronit. All rights reserved.
//

import XCTest
@testable import Sweatworks

class SweatworksTests: XCTestCase {

    func testGetUsers() {

        let userMockRepository: UserMockRepository = UserMockRepository()
        let domain: UserDomain = UserDomain(userRemoteRepository: userMockRepository)
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        let data = NSData(contentsOf: url!)

        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            
            if let dictionary = object as? [String: Any] {
                if let results = dictionary["results"] as? [[String:Any]] {
                    for result in results {
                        domain.addUser(dictionary: result)
                    }
                }
            }
            
        } catch {
            print(error)
        }
        
        let userList: [User] = domain.getUsers()
        
        //Check to see if adding user works with mock data
        XCTAssertEqual(30, userList.count)
    }

}
