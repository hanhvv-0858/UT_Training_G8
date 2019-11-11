//
//  AppDelegate.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/5/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let router = AppCoordinator().anyRouter


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        router.setRoot(for: window!)
        return true
    }

}

