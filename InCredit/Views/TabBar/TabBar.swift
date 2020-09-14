//
//  TabBar.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit

class TabBar: BaseView {

    @IBOutlet var tabBarList: [TabBarButton]!
    @IBOutlet var viewTabBar: UIView!
    var onDidClickTabBar: ((String) -> Void)?
    
    func showBtn() {
        self.isHidden = false
    }
    
    func hiddenBtn() {
        self.isHidden = true
    }
    
    override init() {
        super.init(frame: CGRect(x: 0, y: Device.heightScreen() - TAB_BAR_HEIGHT  - Device.heightBottomBar(), width: Device.widthScreen(), height: TAB_BAR_HEIGHT + Device.heightBottomBar()))
        setupTabBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupTabBar() {
        for tabBar in tabBarList {
            tabBar.onDidClickTabBar = { [weak self] vcName in
                guard let weakSelf = self else { return }
                weakSelf.onDidClickTabBar?(vcName)
            }
         }
    }
}
