//
//  XCTest.swift
//  UT-DemoTests
//
//  Created by le.huu.dung on 8/21/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//
import XCTest

enum ExtensionType: String {
    case json = "json"
}

extension XCTestCase {
    
    func loadStub(name: String, extensionType: ExtensionType) throws -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: extensionType.rawValue)
        let data = try Data(contentsOf: url!)
        return data
    }
    
}
