//
//  LoginVC.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var consHeigthLogo: NSLayoutConstraint!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFBLogin: LoginFB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController as! MainNC).hiddenBtn()
        btnFBLogin.loginHandler = { [weak self] (success) in
            if success {
               (self?.navigationController as! MainNC).loginSucccess()
            }
        }
    }

    override func keyboardWillAppear() {
        super.keyboardWillAppear()
        UIView.animate(withDuration: 0.5, animations: {
            self.imgLogo.alpha = 0
            self.consHeigthLogo.constant = 0
        }, completion: nil)
        
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        let email = tfEmail.text ?? ""
        let pass = tfPassword.text ?? ""
        HttpRequests.request(request: LoginAPI(email: email, password: pass)) { [weak self] (result, response) in
            guard let weakSelf = self else { return }
            if result {
                print("server token \(response.token)")
                UserDefaultUtils.setString(value: response.token, key: KEY_ACCESS_TOKEN)
                (weakSelf.navigationController as! MainNC).loginSucccess()
            }
        }

    }
    
    @IBAction func btnFBLoginClicked(_ sender: Any) {
        btnFBLogin.login(viewController: self)
    }
    
    override func keyboardWillDisappear() {
        super.keyboardWillDisappear()
        UIView.animate(withDuration: 0.5, animations: {
            self.imgLogo.alpha = 1
            self.consHeigthLogo.constant = 146
        }, completion: nil)
    }

}
