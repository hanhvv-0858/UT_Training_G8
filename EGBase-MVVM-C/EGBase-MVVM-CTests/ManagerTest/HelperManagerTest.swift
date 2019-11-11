//
//  HelperManagerTest.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/18/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import XCTest
@testable import EGBase_MVVM_C


class HelperManagerTest: XCTestCase {

    //"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    func testValidEmail() {
        XCTAssertTrue(HelperManager.isValidEmail("email@example.com"))
        XCTAssertTrue(HelperManager.isValidEmail("emailfjj.fjffjfj@example.com"))
        XCTAssertTrue(HelperManager.isValidEmail("very.common@example.com"))
        XCTAssertTrue(HelperManager.isValidEmail("disposable-style.email.with+symbol@example.com"))
        XCTAssertTrue(HelperManager.isValidEmail("l@example.vn"))
        XCTAssertTrue(HelperManager.isValidEmail("l..@example.vn"))
        XCTAssertTrue(HelperManager.isValidEmail("-@mail.com"))
        XCTAssertTrue(HelperManager.isValidEmail("1%@mail.com"))
        XCTAssertTrue(HelperManager.isValidEmail("example-indeed@strange-example.com"))
    }
    
    func testInvalidEmail() {
        XCTAssertFalse(HelperManager.isValidEmail(""))// empty string
        XCTAssertFalse(HelperManager.isValidEmail("plainaddress")) // plain
        XCTAssertFalse(HelperManager.isValidEmail("plainaddress.com")) // thieu @
        XCTAssertFalse(HelperManager.isValidEmail("#@%^%#$@#$@#.com"))
        XCTAssertFalse(HelperManager.isValidEmail("@example.com"))
        XCTAssertFalse(HelperManager.isValidEmail(" email@example.com.kiuu"))
        XCTAssertFalse(HelperManager.isValidEmail("email@example"))
        XCTAssertFalse(HelperManager.isValidEmail("email@111.222.3"))
    }

    func testValidPassword() {
        XCTAssertTrue(HelperManager.isValidPassword("fjfjfjfj"))
        XCTAssertTrue(HelperManager.isValidPassword("123456789"))
        XCTAssertTrue(HelperManager.isValidPassword(" 1234567"))
    }
    
    func testInvalidPassword() {
        XCTAssertFalse(HelperManager.isValidPassword(""))
        XCTAssertFalse(HelperManager.isValidPassword("133"))
    }
    
}
