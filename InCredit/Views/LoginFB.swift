//
//  LoginFB.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/14/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginFB: UIButton {

    @IBInspectable var fontSize: CGFloat = 18
    @IBInspectable var fontName: String = "HelveticaNeue-Bold"

    var loginHandler: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    func configView() {
        self.setTitleColor(UIColor(hex: 0xffffff), for: .normal)
        self.backgroundColor = .blue
        self.titleLabel?.font = UIFont(name: fontName, size: fontSize)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }

    func login(viewController: UIViewController) {
        let loginManager: LoginManager = LoginManager()
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: viewController) { [weak self] loginResult in
            guard let weakSelf = self else { return }
            switch loginResult {
            case .failed(let error):
                weakSelf.loginHandler?(false)
                print(error)
            case .cancelled:
                weakSelf.loginHandler?(false)
                print("User cancelled login.")
            case .success(_, _, let accessToken):
                weakSelf.loginHandler?(true)
                UserDefaultUtils.setString(value: accessToken.tokenString, key: KEY_ACCESS_TOKEN)
                print("token: \(KEY_ACCESS_TOKEN) and \(accessToken.tokenString)")
            }
        }
    }
}
