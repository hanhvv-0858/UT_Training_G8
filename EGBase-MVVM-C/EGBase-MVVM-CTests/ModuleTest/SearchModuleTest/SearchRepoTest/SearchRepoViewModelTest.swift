//
//  SearchRepoViewModelTest.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/19/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import XCTest
import XCoordinator
import SwiftyJSON
@testable import EGBase_MVVM_C

class SearchRepoViewModelTest: XCTestCase {
    var window: UIWindow!
    var coordinator: StubSearchCoordinator!
    var mockupSearchRepoViewController: MockupSearchRepoViewController!
    var sut: SearchRepoViewModel!
    
    override func setUp() {
        window = UIWindow()
        coordinator = StubSearchCoordinator.init()
        coordinator.setRoot(for: window)
        sut = SearchRepoViewModel(router: coordinator.anyRouter)
        mockupSearchRepoViewController = MockupSearchRepoViewController()
        sut.delegate = mockupSearchRepoViewController
    }
    
    override func tearDown() {
        window = nil
        coordinator = nil
        sut = nil
        mockupSearchRepoViewController = nil
    }

    func test_InitViewModel() {
        XCTAssertNotNil(sut)
    }
    
    // test gotoRepoInfo(index: IndexPath)
    func test_GoToRepoInfo_RepoInfoIndex_GreaterThan_ReposCount() {
        // Arrange
        let dummyData = try? loadStub(name: "Repos_10_items", extensionType: .json)
        sut.repos.value = RepoList.fromDatas(jsonObject: dummyData)!
        let index = IndexPath(row: 11, section: 0)
        
        // Act
        sut.gotoRepoInfo(index: index)

        // Assert
        XCTAssertGreaterThan(index.row, sut.repos.value.count)
        XCTAssertEqual(coordinator.getCurrentRoute(), .searchRepo)
    }
    
    func test_GoToRepoInfo_RepoInfoIndex_isEqual_ReposCount() {
        // Arrange // Given
        let dummyData = try? loadStub(name: "Repos_10_items", extensionType: .json)
        sut.repos.value = RepoList.fromDatas(jsonObject: dummyData)!
        let index = IndexPath(row: 9, section: 0)
        let lastRepo = sut.repos.value.last!
        
        // Act // When
        sut.gotoRepoInfo(index: index)
        
        // Assert // Then
        XCTAssertEqual(index.row, sut.repos.value.count - 1)
        XCTAssertEqual(coordinator.getCurrentRoute(), .repoInfo(lastRepo))
    }
    
    func test_GoToRepoInfo_RepoInfoIndex_LessThan_ReposCount() {
        // Arrange
        let dummyData = try? loadStub(name: "Repos_10_items", extensionType: .json)
        sut.repos.value = RepoList.fromDatas(jsonObject: dummyData)!
        let index = IndexPath(row: 0, section: 0)
        let firstRepo = sut.repos.value.first!
        
        // Act
        sut.gotoRepoInfo(index: index)
        
        // Assert
        XCTAssertLessThan(index.row, sut.repos.value.count - 1)
        XCTAssertEqual(coordinator.getCurrentRoute(), .repoInfo(firstRepo))
    }
    
    // test searchRepo(with keyword: String?)
    func test_SearchRepo_Keyword_isEmpty() {
        // Arrange
        let expectation = self.expectation(description: "searchRepo(with: keyword) with keyword empty")
        mockupSearchRepoViewController.searchRepoErrorExpectation = (expectation, .missingLocalParmas)
        // Act
        sut.searchRepo(with: "")
        
        // Wait
        self.waitForExpectations(timeout: 1.0, handler: nil)

        // Assert
        XCTAssertEqual(sut.repos.value.count, 0)
    }
    
    func test_SearchRepo_Keyword_isNil() {
        // Arrange
        let expectation = self.expectation(description: "searchRepo(with: keyword) with keyword = nil")
        mockupSearchRepoViewController.searchRepoErrorExpectation = (expectation, .missingLocalParmas)
        // Act
        sut.searchRepo(with: nil)
        self.waitForExpectations(timeout: 1.0, handler: nil)
        // Assert
        XCTAssertEqual(sut.repos.value.count, 0)
    }
    
    // test needLoadMore()
    
    // test getTotalPage(total: Int?)
}
