//
//  BaseRequestModel.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import ObjectMapper

class RequestBaseModel: Mappable {
    required init?(map: Map) {}
    
    init() {}
    
    func mapping(map: Map) {}
    
}

class ResponseBaseModel: Mappable {
    
    required init?(map: Map) {}
   
    required init() {}
    
    func mapping(map: Map) {}
    
}

