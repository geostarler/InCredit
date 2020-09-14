//
//  DateUltil.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import ObjectMapper

class DateUtils {
    
    static func dateToStr(format: String, date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    static func strToDate(format: String, stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: stringDate) else {
            return Date()
        }
        return date
    }

    static func getDateFormatter(format: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter
    }
}
