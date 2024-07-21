//
//  UserModel.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let company: Company
    let address: Address
    
    struct Address: Decodable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Geo
        
        struct Geo: Decodable {
            let lat: String
            let lng: String
        }
    }
    
    struct Company: Decodable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
}

actor Description {
    var content: String
    
    init(content: String) {
        self.content = content
    }
}

extension Description {
    func update(with newContent: String) {
        self.content = newContent
    }
}
