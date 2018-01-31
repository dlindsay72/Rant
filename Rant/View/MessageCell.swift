//
//  MessageCell.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-29.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    func configure(with message: Message) {
        usernameLbl.text = message.sender
        messageLbl.text = message.body
    }
}
