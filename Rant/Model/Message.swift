//
//  Message.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-29.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import Foundation

struct Message {
    let sender: String = User.currentUser.username
    let body: String
}
