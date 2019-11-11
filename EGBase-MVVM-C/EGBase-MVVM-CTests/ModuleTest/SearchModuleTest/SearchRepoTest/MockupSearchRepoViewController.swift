//
//  MockupSearchRepoViewController.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/19/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import XCTest
import XCoordinator
@testable import EGBase_MVVM_C

class MockupSearchRepoViewController: SearchRepoViewModelDelegate {
    weak var delegate: SearchRepoViewModelDelegate?
    
    var searchRepoErrorExpectation: (XCTestExpectation, errorStatus: HttpStatusCode)?
    
    func searchRepoError(apiStatus: APIStatus) {
        guard let (expectation, errorStatus) = self.searchRepoErrorExpectation else { return }
        if apiStatus.statusCode == errorStatus {
            expectation.fulfill()
        }
    }
}
