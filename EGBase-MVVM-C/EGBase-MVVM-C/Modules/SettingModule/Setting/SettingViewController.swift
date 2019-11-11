//
//  SettingViewController.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController, BindableType {

    var viewModel: SettingViewModel!
    @IBOutlet weak var aboutUsBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    func bindViewModel() {
        
    }
    
    func updateUI() {
        title = "Setting"
    }
    
    @IBAction func tapAboutUsBtn(_ sender: Any) {
        viewModel.goToAboutUs()
    }
    
    @IBAction func tapLogoutBtn(_ sender: Any) {
        viewModel.logout()
    }
}
