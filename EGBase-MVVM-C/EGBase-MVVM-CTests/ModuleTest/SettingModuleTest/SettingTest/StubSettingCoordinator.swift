//
//  MockupSettingCoordinator.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/19/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator
@testable import EGBase_MVVM_C

class StubSettingCoordinator: SettingCoordinator {
    private var currentRoute: SettingRoute?
    
    override func prepareTransition(for route: SettingRoute) -> NavigationTransition {
        currentRoute = route
        return super.prepareTransition(for: route)
    }
    
    func getCurrentRoute() -> SettingRoute? {
        return currentRoute
    }
}
