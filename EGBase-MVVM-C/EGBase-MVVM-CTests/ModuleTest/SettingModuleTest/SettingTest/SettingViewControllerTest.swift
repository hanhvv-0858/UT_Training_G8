//
//  SettingViewControllerTest.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/19/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import XCTest
import XCoordinator
@testable import EGBase_MVVM_C

class SettingViewControllerTest: XCTestCase {
    var window: UIWindow!
    var coordinator: StubSettingCoordinator!
    var mockupSettingViewModel: SettingViewModel!
    var sut: SettingViewController!
    
    override func setUp() {
        window = UIWindow()
        coordinator = StubSettingCoordinator.init()
        coordinator.setRoot(for: window)
        mockupSettingViewModel = SettingViewModel(router: coordinator.anyRouter)
        sut = SettingViewController.fromStoryboard(.setting)
        sut.bind(to: mockupSettingViewModel)
    }

    override func tearDown() {
        sut = nil
        mockupSettingViewModel = nil
        coordinator = nil
        window = nil
    }
    
    func testUpdateUI() {
        // Act
        sut.updateUI()
        
        // Assert
        XCTAssertEqual(sut.title, "Setting")
    }
    
    func testTapAboutUsBtn() {
        // Act
        sut.aboutUsBtn.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertEqual(coordinator.getCurrentRoute(), .about)
    }

    func testTapLogoutBtn() {
        // Act
        sut.logoutBtn.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertEqual(coordinator.getCurrentRoute(), .logout)
    }
}
