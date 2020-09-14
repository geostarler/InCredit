//
//  Device.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit

struct Device {
    
    static let heightBottomBar = { () -> CGFloat in
        if let window = UIApplication.shared.delegate?.window {
            return window?.safeAreaInsets.bottom ?? 0
        }
        return 0
    }
    
    static let heightStatusBar = {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    static let heightScreen = {
        return UIScreen.main.bounds.height
    }

    static let widthScreen = {
        return UIScreen.main.bounds.width
    }
}
