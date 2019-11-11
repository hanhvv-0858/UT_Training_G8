//
//  BaseViewController.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logD("\(String(describing: self))")
        // Do any additional setup after loading the view.
    }
    
    deinit {
        logD("\(String(describing: self))")
    }

}
