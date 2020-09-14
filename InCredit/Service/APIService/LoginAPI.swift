//
//  LoginAPI.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/14/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import Alamofire

class LoginAPI: BaseAPIProtocol{
    typealias RequestModel = RequestLoginModel
    typealias ResponseModel = ResponseLoginModel
    
    var requestModel: RequestLoginModel
       
    var host: String {
        return APIServices.defaultServerHTML
    }
    
    var path: String {
        return APIServices.apiLogin
    }

    var method: HTTPMethod {
        return .get
    }
    
    var params: Parameters {
        return requestModel.toJSON()
    }
    
    var customizeMessage: [Int : String] {
        return [404: "Wrong email or password"]
    }
    
    init(email: String, password: String) {
        requestModel = RequestLoginModel(email: email, password: password)
    }
    
}

