//
//  FollowRepoCoordinator.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/9/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator

enum FollowRepoRoute: Route {
    case followRepo
    case userList
}

class FollowRepoCoordinator: NavigationCoordinator<FollowRepoRoute> {
    
    init() {
        super.init(initialRoute: .followRepo)
    }
    
    override func prepareTransition(for route: FollowRepoRoute) -> NavigationTransition {
        switch route {
        case .followRepo:
            let followRepoVC = FollowRepoViewController.fromStoryboard(.follow)
            let viewModel = FollowRepoViewModel(router: anyRouter)
            followRepoVC.bind(to: viewModel)
            return .push(followRepoVC)
        case .userList:
            let vc = UIViewController()
            vc.view.backgroundColor = .white
            return .push(vc)
        }
    }
}
