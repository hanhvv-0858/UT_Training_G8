//
//  AboutUsViewControllerTest.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/19/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import XCTest

@testable import EGBase_MVVM_C

class AboutUsViewControllerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTitleViewController() {
        let vc = AboutUsViewController.fromStoryboard(.setting)
        vc.viewDidLoad()
        XCTAssertEqual(vc.title, "About Us")
    }

}
