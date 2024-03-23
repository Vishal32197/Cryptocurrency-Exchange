//
//  EndPoint.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 08/10/23.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
}

public typealias HTTPHeaders = [String: String]

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var environment: String { get }
}

public enum CryptoAPI {
    case getAssets
}

extension CryptoAPI: EndPointType {
    var baseURL: URL {
        return URL(string: "https://api.coincap.io/v2/assets")!
    }
    
    var path: String {
        switch self {
        case .getAssets:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getAssets:
            return .get
        }
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var environment: String {
        return "QA"
    }
}
