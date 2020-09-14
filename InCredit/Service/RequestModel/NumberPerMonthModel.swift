//
//  NumberPerMonthModel.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/14/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import ObjectMapper

class NumberPerMonthModel: BaseModel {
    
    var day: Int = 0
    var evening: Int = 0
    var night: Int = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        day <- map["day"]
        evening <- map["evening"]
        night <- map["night"]
    }
}
