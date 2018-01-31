//
//  Message.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-29.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import Foundation

struct Message {
    private(set) var sender: String = User.currentUser.username
    let body: String
    
    init(body: String) {
        self.body = body
    }
    
    init?(dict: [String: String]) {
        guard let sender = dict["sender"], let body = dict["body"] else { return nil }
        self.sender = sender
        self.body = body
    }
    
    func dictionaryRepresentation() -> [String: String] {
        let dict: [String: String] = ["sender": sender, "body": body]
        
        return dict
    }
}
