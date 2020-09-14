//
//  MoneyModel.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/14/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import ObjectMapper

class MoneyModel: BaseModel {
    
     var month: Int = 0
       var score: Int = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        month <- map["month"]
        score <- map["score"]
    }
}
