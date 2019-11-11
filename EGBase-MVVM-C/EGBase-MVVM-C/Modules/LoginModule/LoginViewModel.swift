//
//  LoginViewModel.swift
//  UT-Demo
//
//  Created by maithigiang on 8/3/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation
import XCoordinator

class LoginViewModel {
    
    // MARK: - Variable
    
    private let router: AnyRouter<AppRoute>
    
    var email = Dynamic<String>("")
    var password = Dynamic<String>("")
    var enableLogin = Dynamic<Bool>(false)
    
    // MARK: - Init
    
    init(router: AnyRouter<AppRoute>) {
        self.router = router
    }
    
    // MARK: - Navigator
    
    private func gotoMainTabbar() {
        router.trigger(.maintabbar)
    }
    
    // MARK: - Logic
    
    func checkEnableLogin() {
        if Validator.isValidEmail(email.value) &&
            Validator.isValidPassword(password.value) {
            enableLogin.value = true
        } else {
            enableLogin.value = false
        }
    }
    
    func requestLogin() {
        // API request login
        gotoMainTabbar()
    }
    
}
