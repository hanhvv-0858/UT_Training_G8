//
//  RepoCoordinator.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/9/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator

enum SearchRoute: Route, Equatable {
    case searchRepo
    case repoInfo(Repo)
}

class SearchCoordinator: NavigationCoordinator<SearchRoute> {
    
    init() {
        super.init(initialRoute: .searchRepo)
    }
    
    override func prepareTransition(for route: SearchRoute) -> NavigationTransition {
        switch route {
        case .searchRepo:
            let searchRepo = SearchRepoViewController.fromStoryboard(.search)
            let viewModel = SearchRepoViewModel.init(router: anyRouter)
            searchRepo.bind(to: viewModel)
            return .push(searchRepo)
        case .repoInfo(let repo):
            let vc = RepoInfoViewController.fromStoryboard(.search)
            let viewModel = RepoInfoViewModel.init(router: anyRouter, repo: repo)
            vc.bind(to: viewModel)
            return .push(vc)
        }
    }
}
