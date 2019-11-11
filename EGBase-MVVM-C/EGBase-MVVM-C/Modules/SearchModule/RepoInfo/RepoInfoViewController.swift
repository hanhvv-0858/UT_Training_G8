//
//  RepoInfoViewController.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/18/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit

class RepoInfoViewController: BaseViewController, BindableType {
    
    var viewModel: RepoInfoViewModel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberStar: UILabel!
    @IBOutlet weak var numberFork: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    func bindViewModel() {
        
    }
    
    func updateUI() {
        title = viewModel.repo.name
        descriptionLabel.text = viewModel.repo.descriptionRepo
        numberStar.text = String(viewModel.repo.starCount ?? 0)
        numberFork.text = String(viewModel.repo.folkCount ?? 0)
        languageLabel.text = viewModel.repo.language
    }
    
}
