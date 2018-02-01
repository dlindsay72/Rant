//
//  AppDelegate.swift
//  Rant
//
//  Created by Dan Lindsay on 2018-01-29.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UserNotificationService.shared.authorize()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Did register for notifications")
    }

}

