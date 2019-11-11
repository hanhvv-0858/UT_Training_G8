//
//  ServiceRouteType.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/12/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation
import Alamofire

protocol ServiceRouterType: URLRequestConvertible {
    
    /// The ServiceRouteType's base `URL`.
    func asBaseURL() throws -> URL
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod { get }

    /// URLRequestConvertible
    func asURLRequest() throws -> URLRequest
}

extension ServiceRouterType {
    func asBaseURL() throws -> URL {
        let baseURL = try Config.baseUrl.asURL()
        return baseURL
    }
}


