//
//  AppCoordinator.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/6/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import Foundation
import XCoordinator

enum AppRoute: Route {
    case login
    case maintabbar
}

class AppCoordinator: NavigationCoordinator<AppRoute> {

    init() {
        super.init(initialRoute: .login)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .login:
            let loginVC = LoginViewController.fromStoryboard(.login)
            let loginVM = LoginViewModel(router: anyRouter)
            loginVC.bind(to: loginVM)
            return .push(loginVC)
        case .maintabbar:
            let tabbarCoordinator = MainTabbarCondinator()
            return .present(tabbarCoordinator)
        }
    }
}
