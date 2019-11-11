//
//  Service.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/11/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct SearchRepoResponse: ApiResponseType {
    var data: RepoList?
    var status: APIStatus
}

public typealias SearchRepoHandler = (SearchRepoResponse) -> Void

class RepoService {
    @discardableResult
    static func searchRepo(keyword: String?, itemPerPage: Int = Constant.maxItemPerPage,
                    page: Int = 0, completionHandler: @escaping SearchRepoHandler) -> Request? {
        guard let keyword = keyword, keyword.isEmpty != true else {
            let apiStatus = APIStatus(statusCode: .missingLocalParmas, messageCode: nil)
            completionHandler(SearchRepoResponse(data: nil, status: apiStatus))
            return nil
        }
        
        var params = Parameters()
        params["q"] = keyword
        params["page"] = page
        params["per_page"] = itemPerPage
        let urlRequest = RepoRouter.searchRepo(parameters: params)
        
        return NetworkManager.shared.request(urlRequest: urlRequest, completionHandler: { (responseObject) in
            guard let responseObject = responseObject else {
                let apiStatus = APIStatus(statusCode: .errorResponseObject, messageCode: nil)
                completionHandler(SearchRepoResponse(data: nil, status: apiStatus))
                return
            }
            if responseObject.status.statusCode == .success {
                let listRepo = RepoList.init(jsonObject: responseObject.data)
                completionHandler(SearchRepoResponse(data: listRepo, status: responseObject.status))
            } else {
                completionHandler(SearchRepoResponse(data: nil, status: responseObject.status))
            }
        })
    }
}
