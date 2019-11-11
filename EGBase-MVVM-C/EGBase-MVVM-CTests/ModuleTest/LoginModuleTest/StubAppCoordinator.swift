//
//  MockupAppCoordinator.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/18/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator
@testable import EGBase_MVVM_C


class StubAppCoordinator: AppCoordinator {
    private var currentRoute: AppRoute?

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        currentRoute = route
        return super.prepareTransition(for: route)
    }
    
    func getCurrentRoute() -> AppRoute? {
        return currentRoute
    }
}
