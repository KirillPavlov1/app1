//
//  AppDelegate.swift
//  app1
//
//  Created by Кирилл on 25.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application (_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
      return true
    }

    func application (_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
      return true
    }
}

