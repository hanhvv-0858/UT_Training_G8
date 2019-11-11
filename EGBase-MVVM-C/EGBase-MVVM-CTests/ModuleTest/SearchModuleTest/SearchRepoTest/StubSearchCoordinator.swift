//
//  MockupSearchCoordinator.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/19/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator
@testable import EGBase_MVVM_C

class StubSearchCoordinator: SearchCoordinator {
    private var currentRoute: SearchRoute?
    
    override func prepareTransition(for route: SearchRoute) -> NavigationTransition {
        currentRoute = route
        return super.prepareTransition(for: route)
    }
    
    func getCurrentRoute() -> SearchRoute? {
        return currentRoute
    }
}

