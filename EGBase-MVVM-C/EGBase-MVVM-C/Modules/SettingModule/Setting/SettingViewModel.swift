//
//  SettingViewModel.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation
import XCoordinator

class SettingViewModel {
    
    // MARK: - Variable
    
    private let router: AnyRouter<SettingRoute>
    
    // MARK: - Init
    
    init(router: AnyRouter<SettingRoute>) {
        self.router = router
    }
    
    // MARK: - Navigator
    func logout() {
        router.trigger(.logout)
    }
    
    func goToAboutUs() {
        router.trigger(.about)
    }
    
    // MARK: - Logic
}
