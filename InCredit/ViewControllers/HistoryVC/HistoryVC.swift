//
//  HistoryVC.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/15/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit

class HistoryVC: BaseVC {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tblHistory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnBackClicked(_ sender: Any) {
        (self.navigationController as! MainNC).popViewController(animated: true)
    }
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
