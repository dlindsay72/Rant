//
//  UserNotificationService.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-31.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import UIKit
import UserNotifications

class UserNotificationService: NSObject {
    
    private override init() {}
    
    static let shared = UserNotificationService()
    let userNotifCenter = UNUserNotificationCenter.current()
    
    func authorize() {
        let options: UNAuthorizationOptions = [.badge, .sound, .alert]
        userNotifCenter.requestAuthorization(options: options) { (granted, error) in
            print(error ?? "No UserNotificationService auth error")
            guard granted else { return }
            
            DispatchQueue.main.async {
                self.configure()
            }
        }
    }
    
    func configure() {
        userNotifCenter.delegate = self
        
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
    }
}

extension UserNotificationService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UserNotif did receive")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("UserNotif will present")
        
        completionHandler([])
    }
}
















