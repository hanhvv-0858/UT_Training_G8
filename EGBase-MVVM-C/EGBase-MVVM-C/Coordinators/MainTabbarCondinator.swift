//
//  MainTabbarCondinator.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/9/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator

enum MainTabbarRoute: Route {
    case searchRepo
    case followRepo
    case setting
}

class MainTabbarCondinator: TabBarCoordinator<MainTabbarRoute> {
    private let searchRepoRouter: AnyRouter<SearchRoute>
    private let followRepoRouter: AnyRouter<FollowRepoRoute>
    private let settingRouter: AnyRouter<SettingRoute>

    convenience init() {
        let searchRepoCoordinator = SearchCoordinator()
        searchRepoCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let followRepoCoordinator = FollowRepoCoordinator()
        followRepoCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let settingCoordinator = SettingCoordinator()
        settingCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        self.init(searchRepoRouter: searchRepoCoordinator.anyRouter,
                  followRepoRouter: followRepoCoordinator.anyRouter,
                  settingRouter: settingCoordinator.anyRouter)
    }
    
    init(searchRepoRouter: AnyRouter<SearchRoute>,
         followRepoRouter: AnyRouter<FollowRepoRoute>,
         settingRouter: AnyRouter<SettingRoute>) {
        self.searchRepoRouter = searchRepoRouter
        self.followRepoRouter = followRepoRouter
        self.settingRouter = settingRouter
        super.init(tabs: [searchRepoRouter, followRepoRouter, settingRouter])
    }
    
//    override func prepareTransition(for route: MainTabbarRoute) -> TabBarTransition {
//        switch route {
//        case .searchRepo:
//            return .select(searchRepoRouter)
//        case .followRepo:
//            return .select(followRepoRouter)
//        case .setting:
//            return .select(settingRouter)
//        }
//    }
}

