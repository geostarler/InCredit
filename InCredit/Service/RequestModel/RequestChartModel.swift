//
//  RequestChartModel.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/14/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import ObjectMapper

class RequestChartModel: RequestBaseModel {
    var phone: String = ""
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    init(phone: String) {
        super.init()
        self.phone = phone
    }
    
    override func mapping(map: Map) {
        phone <- map["phone"]

    }
}

class ResponseChartModel: ResponseBaseModel {
    var age: Int = 0
    var phone: Int = 0
    var city: String = ""
    var creditScore: [CreditModel] = []
    var numberCall: Int = 0
    var numberPerMonth: NumberPerMonthModel = NumberPerMonthModel()
    var sum: [MoneyModel] = []
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        age <- map["age"]
        city <- map["city"]
        creditScore <- map["credit_score"]
        numberCall <- map["number_partner_contact_per_month"]
        numberPerMonth <- map["numbers_call_per_month"]
        phone <- map["phone"]
        sum <- map["sum_charge_money"]
    }

}
