//
//  MockHomeScreenPresenter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import XCTest
@testable import MovieDBApp

class MockHomeScreenPresenter: HomeScreenPresenter {
    
    init(presenter: HomeScreenPresenter) {
        super.init()
        self.view = presenter.view
        self.interactor = presenter.interactor
        self.router = presenter.router
    }
}
