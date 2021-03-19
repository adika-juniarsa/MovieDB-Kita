//
//  HomeScreenRouterTests.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import XCTest
@testable import MovieDBApp

class HomeScreenRouterTests: MovieDBAppTests {
	
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func createRouter() -> HomeScreenRouter? {
        let router = HomeScreenRouter.createModule().presenter?.router as? HomeScreenRouter
        return router
    }
    
    func createMockRouter(withRouter router: HomeScreenRouter) -> MockHomeScreenRouter? {
        let mockRouter = MockHomeScreenRouter(router: router)
        return mockRouter
    }
}

extension HomeScreenRouterTests {
    
    
}
