//
//  LoginViewControllerTest.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/18/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCTest
@testable import EGBase_MVVM_C

class LoginViewControllerTest: XCTestCase {
    var window: UIWindow!
    var coordinator: StubAppCoordinator!
    var mockupLoginViewModel: LoginViewModel!
    var sut: LoginViewController!
    
    
    override func setUp() {
        window = UIWindow()
        coordinator = StubAppCoordinator.init()
        coordinator.setRoot(for: window)
        mockupLoginViewModel = LoginViewModel(router: coordinator.anyRouter)
        sut = LoginViewController.fromStoryboard(.login)
        sut.bind(to: mockupLoginViewModel)
        sut.viewDidLoad()
    }
    
    override func tearDown() {
        coordinator = nil
        sut = nil
        mockupLoginViewModel = nil
        window = nil
    }
    
    func testBindingData_ToViewModel() {
        // Arrange
        let dummyText = "ddddd"
        sut.emailTextField.text = dummyText
        sut.passwordTextField.text = dummyText
        
        // Act
        sut.emailTextField.textFieldDidChange(sut.emailTextField)
        sut.passwordTextField.textFieldDidChange(sut.passwordTextField)
        
        // Assert
        XCTAssertEqual(mockupLoginViewModel.email.value, dummyText)
        XCTAssertEqual(mockupLoginViewModel.password.value, dummyText)
    }
    
    // test updateUI()
    func testLoginButtonEnable() {
        // Arrange
        mockupLoginViewModel.enableLogin.value = false
        
        // Act
        mockupLoginViewModel.enableLogin.value = true
        
        // Assert
        XCTAssertTrue(sut.loginButton.isEnabled)
        XCTAssertEqual(sut.loginButton.alpha, 1)
    }
    
    func testLoginButtonDisable() {
        // Arrange
        mockupLoginViewModel.enableLogin.value = true
        
        // Act
        mockupLoginViewModel.enableLogin.value = false
        
        // Assert
        XCTAssertFalse(sut.loginButton.isEnabled)
        XCTAssertNotEqual(sut.loginButton.alpha, 1)
    }
    
    func testTouchUpInsideLoginButton() {
        // Arrange
        sut.emailTextField.text = "hello@hdh.com"
        sut.passwordTextField.text = "12345678"
        
        // Act
        sut.loginButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertNotNil(coordinator.rootViewController.presentedViewController)
        XCTAssertEqual(sut.emailTextField.text, "")
        XCTAssertEqual(sut.passwordTextField.text, "")
    }
    
    func testNotTouchUpInSideLoginButton() {
        // Arrange
        sut.emailTextField.text = "hello@hdh.com"
        sut.passwordTextField.text = "12345678"
        
        // Act
        sut.loginButton.sendActions(for: .touchUpOutside)
        
        // Assert
        XCTAssertNil(coordinator.rootViewController.presentedViewController)
        XCTAssertNotEqual(sut.emailTextField.text, "")
        XCTAssertNotEqual(sut.passwordTextField.text, "")
    }
}
