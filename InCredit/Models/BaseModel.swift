//
//  BaseModel.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//
import ObjectMapper

class BaseModel: Mappable {
    init() {}
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
    }

}

