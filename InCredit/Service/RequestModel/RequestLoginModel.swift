//
//  RequestLoginModel.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/14/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import ObjectMapper

class RequestLoginModel: RequestBaseModel {
    var email: String = ""
    var password: String = ""
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    init(email: String, password: String) {
        super.init()
        self.email = email
        self.password = password
    }
    
    override func mapping(map: Map) {
        email <- map["user_name"]
        password <- map["password"]
    }
}

class ResponseLoginModel: ResponseBaseModel {
    var token: String = ""
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        token <- map["token"]
    }

}
