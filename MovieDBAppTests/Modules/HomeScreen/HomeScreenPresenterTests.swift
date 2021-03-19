//
//  HomeScreenPresenterTests.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import XCTest
@testable import MovieDBApp

class HomeScreenPresenterTests: MovieDBAppTests {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func createPresenter() -> HomeScreenPresenter? {
        let presenter = HomeScreenRouter.createModule().presenter as? HomeScreenPresenter
        return presenter
    }
    
    func createMockPresenter(withPresenter presenter: HomeScreenPresenter) -> MockHomeScreenPresenter? {
        let mockPresenter = MockHomeScreenPresenter(presenter: presenter)
        return mockPresenter
    }
}

extension HomeScreenPresenterTests {
    
    
}
