//
//  Ultil.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class Utils: NSObject {
    static func showLoadingIndicator() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(type: .ballSpinFadeLoader))
    }
    
    static func hideLoadIndicator() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
}
