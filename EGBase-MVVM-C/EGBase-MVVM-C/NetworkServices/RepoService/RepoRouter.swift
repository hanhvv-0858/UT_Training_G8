//
//  RepoRouter.swift
//  UT-Demo
//
//  Created by maithigiang on 8/4/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Alamofire

enum RepoRouter {
    case searchRepo(parameters: Parameters)
}

extension RepoRouter: ServiceRouterType {
    
    var method: HTTPMethod {
        switch self {
        case .searchRepo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .searchRepo :
            return "/search/repositories"
        }
    }
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try asBaseURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .searchRepo(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
