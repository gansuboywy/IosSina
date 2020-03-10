//
//  AppDelegate.swift
//  Sina
//
//  Created by westking on 2020/03/02.
//  Copyright © 2020 westking. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    /// create window manually
    var  window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // set color for all tab bar
        UITabBar.appearance().tintColor = UIColor.orange
        UINavigationBar.appearance().tintColor = UIColor.orange
        
        /*
         the following code is used to lunach screen by code
         in this system, we will use storyboard to lunach screen,
         so i comment the code below
         */
//        /// instantiate window
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = MainViewController()
//        // make window to display
//        window?.makeKeyAndVisible()
        
        // MARK:- Test
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TestViewController()
        // make window to display
        window?.makeKeyAndVisible()
        return true
    }



}

