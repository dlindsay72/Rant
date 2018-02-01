//
//  User.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-31.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import Foundation

class User {
    
    var username = "" {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    private init() {}
    
    static let currentUser = User()
    
    func signIn() {
        let userDefaults = UserDefaults.standard
        guard let username = userDefaults.string(forKey: "username") else { return }
        self.username = username
        
    }
    
    func isSignedIn() -> Bool {
        return UserDefaults.standard.string(forKey: "username") != nil
    }
    
}
