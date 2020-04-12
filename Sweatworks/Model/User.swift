//
//  User.swift
//  Sweatworks
//
//  Created by Ronit on 4/10/20.
//  Copyright © 2020 Ronit. All rights reserved.
//

import Foundation

struct User : Codable, Identifiable {
    var id = UUID()
    var firstName : String?
    var lastName : String?
    var address : String?
    var imageUrl : String?
    var phoneNumber : String?
    
    init(dictionary: [String: Any]) {
        let name = dictionary["name"] as! [String: Any]
        firstName = name["first"] as? String
        lastName = name["last"] as? String
        
        phoneNumber = dictionary["phone"] as? String
        
        let location = dictionary["location"] as! [String: Any]
        let street = location["street"] as! [String: Any]
        var addressArray : [String] = []
        if let streetNumber = street["number"] as? Int {
            addressArray.append(String(streetNumber))
        }
        if let streetName = street["name"] as? String {
            addressArray.append(streetName)
        }
        if let city = location["city"] as? String {
            addressArray.append(city)
        }
        if let state = location["state"] as? String {
            addressArray.append(state)
        }
        if let country = location["country"] as? String {
            addressArray.append(country)
        }
        if let postcode = location["postcode"] as? String {
            addressArray.append(postcode)
        }
        address = addressArray.joined(separator: ", ")
        let picture = dictionary["picture"] as! [String: Any]
        imageUrl = picture["large"] as? String
    }
}
