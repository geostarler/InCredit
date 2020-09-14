//
//  ChartAPI.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/14/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import Alamofire

class ChartAPI: BaseAPIProtocol{
    
    
    typealias RequestModel = RequestChartModel
    typealias ResponseModel = ResponseChartModel
    
    var requestModel: RequestChartModel
    
    var host: String {
        return APIServices.defaultServerHTML
    }
    
    var path: String {
        return APIServices.apiChart
    }

    var method: HTTPMethod {
        return .get
    }
    
    var params: Parameters {
        return requestModel.toJSON()
    }
    
    var customizeMessage: [Int : String] {
        return [404: "Cannot get data"]
    }
    
    init(phone: String) {
        requestModel = RequestChartModel(phone: phone)
    }
    
}


