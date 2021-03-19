//
//  HomeScreenInteractorTests.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import XCTest
@testable import MovieDBApp

class HomeScreenInteractorTests: MovieDBAppTests {
    
    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        session = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        session = nil
        super.tearDown()
    }
    
    func createInteractor() -> HomeScreenInteractor? {
        let interactor = HomeScreenRouter.createModule().presenter?.interactor as? HomeScreenInteractor
        return interactor
    }
    
    func createMockInteractor(withInteractor interactor: HomeScreenInteractor) -> MockHomeScreenInteractor? {
        let mockInteractor = MockHomeScreenInteractor(interactor: interactor)
        return mockInteractor
    }
}

extension HomeScreenInteractorTests {
    
    func test_getPopular_hasGivenResult() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=ad7c0bd23167675d55bc5bd97d664c00&page=1")
        let promise = expectation(description: "Status code: 200 or 201")
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 || statusCode == 201 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
    }
}
