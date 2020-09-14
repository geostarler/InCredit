//
//  BaseAPIProtocol.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import Alamofire

protocol BaseAPIProtocol: URLRequestConvertible {
    associatedtype RequestModel
    associatedtype ResponseModel
    
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var params: Parameters { get }
    var headers: [String: String] { get }
    var isShowLoading: Bool { get }
    var encode: ParameterEncoding { get }
    var requestModel: RequestModel { get set }
    var customizeMessage: [Int: String] { get }
}

extension BaseAPIProtocol {
    var host: String {
        get {
            return ""
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var params: Parameters {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var isShowLoading: Bool {
        return true
    }
    
    var encode: ParameterEncoding {
        return URLEncoding.default
    }
    
    var customizeMessage: [Int: String] {
        return [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: URL(string: host + path)!)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        if params.count != 0 {
            request = try encode.encode(request, with: params)
        }
        return request
    }
}




