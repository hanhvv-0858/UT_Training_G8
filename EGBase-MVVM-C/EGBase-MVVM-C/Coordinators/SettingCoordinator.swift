//
//  SettingCoordinator.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator

enum SettingRoute: Route {
    case setting
    case about
    case logout
}

class SettingCoordinator: NavigationCoordinator<SettingRoute> {
    
    init() {
        super.init(initialRoute: .setting)
    }
    
    override func prepareTransition(for route: SettingRoute) -> NavigationTransition {
        switch route {
        case .setting:
            let settingVC = SettingViewController.fromStoryboard(.setting)
            let viewModel = SettingViewModel(router: anyRouter)
            settingVC.bind(to: viewModel)
            return .push(settingVC)
        case .about:
            let aboutUs = AboutUsViewController.fromStoryboard(.setting)
            return .push(aboutUs)
        case .logout:
            return .dismissToRoot()
        }
    }
}
