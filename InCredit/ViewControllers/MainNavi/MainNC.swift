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
        addTabBarView()
        // Do any additional setup after loading the view.
    }
    
    func checkNavigation() {
        if UserDefaultUtils.checkKey(key: KEY_ACCESS_TOKEN) {
            self.openHomeScreen()
        } else {
            self.openLoginScreen()
        }
    }
    
    func openHomeScreen() {
        let home = HomeVC(nibName: "HomeVC", bundle: nil)
        self.viewControllers = [home]
    }
    
    func openLoginScreen() {
        let home = LoginVC(nibName: "LoginVC", bundle: nil)
        self.viewControllers = [home]
    }
    
    private func addTabBarView() {
        viewTabBar = TabBar()
        self.view.addSubview(viewTabBar)
        viewTabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewTabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            viewTabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewTabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            viewTabBar.heightAnchor.constraint(equalToConstant: TAB_BAR_HEIGHT + Device.heightBottomBar())
        ])
        
        viewTabBar.onDidClickTabBar = { [weak self] (vcName) in
            guard let weakSelf = self else { return }
            weakSelf.changeView(vcName: vcName)
        }
    }
    
    func changeView(vcName: String, title: String = "") {
//        if vcName == "HomeVC" {
//            self.popToRootViewController(animated: true)
//        } else if vcName == "SearchVC" {
//            var lastVCName = ""
//            if let lastVc = self.topViewController {
//                lastVCName = String(describing: type(of: lastVc))
//           }
//            if vcName != "" && lastVCName != vcName {
//                self.pushViewController(SearchVC(), animated: true)
//            }
//        }else {
//            var lastVCName = ""
//            if let lastVc = self.topViewController {
//                 lastVCName = String(describing: type(of: lastVc))
//            }
//            if vcName != "" && lastVCName != vcName {
//                if let vc = Utils.getViewControllerFromName(name: vcName) {
//                if title != "" {
//                    vc.title = title
//                    }
//                    self.pushViewController(vc, animated: true)
//                    if self.viewControllers.count >= 3 {
//                        self.viewControllers.removeSubrange(1..<self.viewControllers.count - 1)
//                    }
//                    print("count stack \(self.viewControllers.count)")
//                }
//            }
//        }
//        postUpdateMenu(vcName: vcName)
    }
    
    func showBtn() {
        viewTabBar.showBtn()
    }
    
    func hiddenBtn() {
        viewTabBar.hiddenBtn()
    }
    
    func loginSucccess() {
        let home = HomeVC(nibName: "HomeVC", bundle: nil)
        self.viewControllers = [home]
        self.openHomeScreen()

    }
    
    func logOut() {
        UserDefaultUtils.removeKey(key: KEY_ACCESS_TOKEN)
        self.openLoginScreen()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
