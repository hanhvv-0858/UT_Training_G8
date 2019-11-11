//
//  FollowRepoViewController.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit

class FollowRepoViewController: BaseViewController, BindableType {

    var viewModel: FollowRepoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    func bindViewModel() {
        
    }
    
    func updateUI() {
        title = "Follow Repo"
    }
    
}
