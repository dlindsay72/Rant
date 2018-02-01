//
//  MainVC.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-29.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        User.currentUser.signIn()
        
        PersistanceService.shared.getMessages { (messages) in
            self.messages = messages
            self.tableView.reloadData()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !User.currentUser.isSignedIn() {
            AlertService.signIn(to: self) {
                print("Signed in!")
            }
        }
    }
    
    @IBAction func onComposeTapped() {
        AlertService.composeAlert(in: self) { (message) in
            print(message)
            self.insert(message)
        }
    }
    
    func insert(_ message: Message) {
        messages.append(message)
        
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        
        PersistanceService.shared.save(messages)
    }

}

extension MainVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as? MessageCell else { return UITableViewCell() }
        let message = messages[indexPath.row]
        
        cell.configure(with: message)
        
        return cell
        
    }
}

