//
//  PhoneVC.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/15/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit

class PhoneVC: BaseVC {

    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSearchClicked(_ sender: Any) {
        print("Phone number: \(PHONE_NUMBER)")
        HttpRequests.request(request: ChartAPI(phone: self.tfPhone.text ?? "")) { [weak self] (result, response) in
            guard let weakSelf = self else { return }
            if result {
                if response.phone == 0 {
                    weakSelf.lblError.isHidden = false
                } else {
                    PHONE_NUMBER = weakSelf.tfPhone.text ?? ""
                    let home = HomeVC(nibName: "HomeVC", bundle: nil)
                    (weakSelf.navigationController as! MainNC).pushViewController(home, animated: true)
                }
            } else {
                weakSelf.lblError.isHidden = false
                return
            }
        }
    }
    
    @IBAction func btnLogOutClicked(_ sender: Any) {
        (self.navigationController as! MainNC).logOut()
    }
    
    @IBAction func btnHistoryClicked(_ sender: Any) {
        let history = HistoryVC(nibName: "HistoryVC", bundle: nil)
        (self.navigationController as! MainNC).pushViewController(history, animated: true)
    }
}
