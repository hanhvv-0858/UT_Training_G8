//
//  SettingViewModelTest.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/19/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import XCTest
import XCoordinator
@testable import EGBase_MVVM_C

class SettingViewModelTest: XCTestCase {
    var window: UIWindow!
    var coordinator: StubSettingCoordinator!
    var sut: SettingViewModel?
    
    override func setUp() {
        window = UIWindow()
        coordinator = StubSettingCoordinator.init()
        coordinator.setRoot(for: window)
        sut = SettingViewModel(router: coordinator.anyRouter)
    }

    override func tearDown() {
        window = nil
        coordinator = nil
        sut = nil
    }

    func testInitViewModel() {
        XCTAssertNotNil(sut)
    }
    
    func testLogout() {
        // Act
        sut?.logout()
        
        // Assert
        XCTAssertEqual(coordinator.getCurrentRoute(), .logout)
    }
    
    func testGoToAboutUs() {
        // Act
        sut?.goToAboutUs()
        
        // Assert
        XCTAssertEqual(coordinator.getCurrentRoute(), .about)
    }
    

}
