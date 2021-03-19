//
//  HomeScreenViewControllerTests.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import XCTest
@testable import MovieDBApp

// MARK: - Test Setup

class HomeScreenViewControllerTests: MovieDBAppTests {
    
    // MARK: Data members
    
    var viewController: HomeScreenViewController!
    var mockViewController: MockHomeScreenViewController!
    var mockRouter: MockHomeScreenRouter!
    
    // MARK: Overrides
    
    override func setUp() {
        viewController = createViewController()
        mockViewController = createMockViewController(withView: viewController)
        mockRouter = MockHomeScreenRouter(router: HomeScreenRouter())
        
        viewController.presenter = MockHomeScreenPresenter(presenter: HomeScreenPresenter())
        viewController.presenter?.router = mockRouter
    }
    
    override func tearDown() {
        viewController = nil
        mockViewController = nil
        mockRouter = nil
    }
    
    // MARK: Methods
    
    func createViewController() -> HomeScreenViewController {
        let viewController: HomeScreenViewController? = HomeScreenRouter.createModule()
        viewController?.loadViewIfNeeded()
        return viewController!
    }
    
    func createMockViewController(withView view: HomeScreenViewController) -> MockHomeScreenViewController? {
        let mockViewController = MockHomeScreenViewController(view: view)
        return mockViewController
    }
}

extension HomeScreenViewControllerTests {
    
    func testControllerHasTableView() {
        XCTAssertNotNil(viewController.tableView,
                        "Controller should have a tableview")
    }
    
    func testTableViewHasCells() {
        let cell = viewController.tableView.dequeueReusableCell(withIdentifier: "MovieCell")
        XCTAssertNotNil(cell,
                        "TableView should be able to dequeue cell with identifier: 'MovieCell'")
    }
    
    func testTableViewHasFooter() {
        let cell = viewController.tableView.dequeueReusableHeaderFooterView(withIdentifier: "ButtonCellFooter")
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier 'ButtonCellFooter'")
    }
    
    func test_rigthMenuButtonAction_HasNavigationToFavoritePage() {
        viewController.rightButtonAction()
        XCTAssertTrue(mockRouter.isOpenFavorite, "should be called")
    }
    
    func test_getPopular_HasNavigationToFavoritePage() {
        viewController.getPopular()
        XCTAssertTrue(mockRouter.isOpen, "should be called")
    }
    
    func test_getUpcoming_HasNavigationToFavoritePage() {
        viewController.getUpcoming()
        XCTAssertTrue(mockRouter.isOpen, "should be called")
    }
    
    func test_getTopRated_HasNavigationToFavoritePage() {
        viewController.getTopRated()
        XCTAssertTrue(mockRouter.isOpen, "should be called")
    }
    
    func test_getNowPlaying_HasNavigationToFavoritePage() {
        viewController.getNowPlaying()
        XCTAssertTrue(mockRouter.isOpen, "should be called")
    }
    
    func test_getCategory_HasNavigationToFavoritePage() {
        viewController.getCategory()
        XCTAssertTrue(mockRouter.isOpen, "should be called")
    }
}
