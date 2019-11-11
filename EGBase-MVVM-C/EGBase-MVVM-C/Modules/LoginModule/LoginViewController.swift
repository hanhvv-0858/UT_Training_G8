//
//  ViewController.swift
//  UT-Demo
//
//  Created by maithigiang on 8/1/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, BindableType {
    var viewModel: LoginViewModel!
    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    func bindViewModel() {
        emailTextField.bind { [weak self] (email) in
            guard let strongSelf = self else { return }
            strongSelf.viewModel.email.value = email
            strongSelf.viewModel.checkEnableLogin()
        }
        
        passwordTextField.bind { [weak self] (password) in
            guard let strongSelf = self else { return }
            strongSelf.viewModel.password.value = password
            strongSelf.viewModel.checkEnableLogin()
        }
    }
    
    private func updateUI() {
        self.viewModel.enableLogin.bindAndFire {[weak self] (enable) in
            guard let strongSelf = self else { return }
            strongSelf.loginButton.isEnabled = enable
            strongSelf.loginButton.alpha = enable ? 1 : 0.5
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel.requestLogin()
        // Có thể dùng bindAndFire để clear text email và password
        emailTextField.text = ""
        passwordTextField.text = ""
    }
}

