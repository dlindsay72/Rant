//
//  PersistanceService.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-31.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import Foundation

class PersistanceService {
    
    private init() {}
    
    static let shared = PersistanceService()
    
    let userDefaults = UserDefaults.standard
    
    func save(_ messages: [Message]) {
        var dictArray = [[String: String]]()
        
        for message in messages {
            dictArray.append(message.dictionaryRepresentation())
        }
        
        userDefaults.set(dictArray, forKey: "messages")
    }
    
    func getMessages(completion: @escaping ([Message]) -> Void) {
        guard let dictArray = userDefaults.array(forKey: "messages") as? [[String: String]] else { return }
        
        var messages = [Message]()
        for dict in dictArray {
            guard let message = Message(dict: dict) else { continue }
            messages.append(message)
        }
        
        DispatchQueue.main.async {
            completion(messages)
        }
    }
    
}
