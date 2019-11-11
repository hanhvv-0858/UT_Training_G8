//
//  LoginViewModelTest.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/18/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import XCTest
import XCoordinator
@testable import EGBase_MVVM_C

class LoginViewModelTest: XCTestCase {
    var window: UIWindow!
    var coordinator: StubAppCoordinator!
    var sut: LoginViewModel!
    
    override func setUp() {
        window = UIWindow()
        coordinator = StubAppCoordinator.init()
        coordinator.setRoot(for: window)
        sut = LoginViewModel(router: coordinator.anyRouter)
    }

    override func tearDown() {
        coordinator = nil
        sut = nil
        window = nil
    }
    
    func testInit_ValidView_InstantiatesObject() {
        sut = LoginViewModel(router: coordinator.anyRouter)
        
        XCTAssertNotNil(sut)
    }
    
}

// Mark: Test Binding data
extension LoginViewModelTest {
    
    func testLoginAction() {
        // Act
        sut.requestLogin()
        
        // Assert
        XCTAssertEqual(coordinator.getCurrentRoute(), .maintabbar)
        XCTAssertNotNil(coordinator.rootViewController.presentedViewController)
    }
}

// MARK: Test checkEnableLogin()
extension LoginViewModelTest {
    func testEnableLogin_EmailIsValid_PasswordIsValid() {
        // Arrange
        sut.email.value = "abc@hello.com"
        sut.password.value = "12345678"
        
        // Act
        sut.checkEnableLogin()
        
        // Assert
        XCTAssertTrue(sut.enableLogin.value)
    }
    
    func testEnableLogin_EmailIsInvalid_PasswordIsValid() {
        // Arrange
        sut.email.value = "@hello.com"
        sut.password.value = "12345678"
        
        // Act
        sut.checkEnableLogin()
        
        // Assert
        XCTAssertFalse(sut.enableLogin.value)
    }
    
    func testEnableLogin_EmailIsValid_PasswordIsInvalid() {
        // Arrange
        sut.email.value = "abc@hello.com"
        sut.password.value = ""
        
        // Act
        sut.checkEnableLogin()
        
        // Assert
        XCTAssertFalse(sut.enableLogin.value)
    }
    
    func testEnableLogin_EmailIsInvalid_PasswordIsInvalid() {
        // Arrange
        sut.email.value = "@hello.com"
        sut.password.value = "1345678"
        
        // Act
        sut.checkEnableLogin()
        
        // Assert
        XCTAssertFalse(sut.enableLogin.value)
    }
}
