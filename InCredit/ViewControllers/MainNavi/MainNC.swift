//
//  MainNC.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit

class MainNC: UINavigationController {

    private var viewTabBar: TabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func checkNavigation() {
        if UserDefaultUtils.checkKey(key: KEY_ACCESS_TOKEN) {
            self.openPhoneScreen()
        } else {
            self.openLoginScreen()
        }
    }
    
    func openPhoneScreen() {
        let phone = PhoneVC(nibName: "PhoneVC", bundle: nil)
        self.viewControllers = [phone]
    }
    
    func openHomeScreen() {
        let home = HomeVC(nibName: "HomeVC", bundle: nil)
        self.viewControllers = [home]
    }
    
    func openLoginScreen() {
        let home = LoginVC(nibName: "LoginVC", bundle: nil)
        self.viewControllers = [home]
    }
    
    func loginSucccess() {
        self.openPhoneScreen()

    }
    
    func logOut() {
        UserDefaultUtils.removeKey(key: KEY_ACCESS_TOKEN)
        self.openLoginScreen()
    }

}
