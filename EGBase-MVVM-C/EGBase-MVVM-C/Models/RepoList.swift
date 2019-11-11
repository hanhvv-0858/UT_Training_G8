//
//  RepoList.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/12/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import SwiftyJSON

class RepoList: NSObject {
    var totalCount: Int = 0
    var repos: [Repo]?
    
    convenience init?(json: JSON?) {
        guard let _json = json else { return nil }
        self.init()
        
        // parse json
        self.parseJson(_json)
    }
    
    convenience init?(jsonObject: Any?) {
        guard let jsonData = jsonObject else { return nil }
        self.init()
        
        // parse json
        let json = JSON(jsonData)
        self.parseJson(json)
    }
    
    private func parseJson(_ json: JSON) {
        self.totalCount = json["total_count"].intValue
        self.repos = RepoList.fromJSONDatas(jsons: json["items"].arrayValue)
    }
    
    static func fromJSONDatas(jsons: [JSON]?) -> [Repo]? {
        guard let jsonData = jsons else { return nil }
        var repos: [Repo] = []
        
        // loops
        for item in jsonData {
            if let repo = Repo(json: item) {
                repos.append(repo)
            }
        }
        
        // return
        return repos
    }
    
    static func fromDatas(jsonObject: Any?) -> [Repo]? {
        guard let jsonData = jsonObject else { return nil }
        
        // parse json
        let json = JSON(jsonData)
        let reposData = json["items"].arrayValue
        
        return RepoList.fromJSONDatas(jsons: reposData)
    }
}
