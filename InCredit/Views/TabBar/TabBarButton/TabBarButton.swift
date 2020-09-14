//
//  TabBarButton.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit

@IBDesignable class TabBarButton: BaseView {

   
    @IBOutlet weak var btnTabBar: UIButton!
    @IBOutlet weak var imgButton: UIImageView!
    
    @IBAction func onDidClickTab(_ sender: Any) {
        onDidClickTabBar?(self.tabName)
    }
    
    @IBInspectable var buttonImage: UIImage? {
        get {
            return imgButton.image
        }
        set {
            imgButton.image = newValue
        }
    }
    
    @IBInspectable var vcName: String {
        get {
            return tabName
        }
        set {
            tabName = newValue
        }
    }
    
    private var tabName = ""
    var onDidClickTabBar: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnTabBar.imageView?.contentMode = .scaleAspectFit
    }

}
