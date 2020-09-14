//
//  AppDelegate.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//


import UIKit
import IQKeyboardManagerSwift
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainNC: MainNC!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.mainNC = MainNC()
        let bundleID = (Bundle.main.bundleIdentifier ?? "") as String
        print("====> BundleID= \(bundleID)")
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = mainNC
        self.mainNC.checkNavigation()
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    func application( _ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool { ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] )
    }
}

