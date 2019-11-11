//
//  User.swift
//  UT-Demo
//
//  Created by maithigiang on 8/3/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import SwiftyJSON

class Repo: NSObject {
    var id = 0
    var name: String?
    var fullname: String?
    var urlString: String?
    var starCount: Int?
    var folkCount: Int?
    var descriptionRepo: String?
    var language: String?
    
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
        self.id = json["id"].intValue
        self.name = json["name"].string
        self.fullname = json["full_name"].string
        self.urlString = json["html_url"].string
        self.starCount = json["stargazers_count"].intValue
        self.folkCount = json["forks"].intValue
        self.descriptionRepo = json["description"].string
        self.language = json["language"].string
    }
}

