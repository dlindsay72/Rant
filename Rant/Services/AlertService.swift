//
//  AlertService.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-31.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func composeAlert(in vc: UIViewController, completion: @escaping (Message) -> Void) {
        let alertController = UIAlertController(title: "Rant about some stuff...", message: "Am I the only one who...", preferredStyle: .alert)
        alertController.addTextField { (messageTextField) in
            messageTextField.placeholder = "Begin Rant"
        }
        
        let send = UIAlertAction(title: "Rant", style: .default) { (_) in
            guard let messageBody = alertController.textFields?.first?.text else { return }
            let message = Message(body: messageBody)
            completion(message)
        }
        alertController.addAction(send)
        vc.present(alertController, animated: true, completion: nil)
    }
}
