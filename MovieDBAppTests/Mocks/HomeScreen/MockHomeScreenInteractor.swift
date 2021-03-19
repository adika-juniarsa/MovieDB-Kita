//
//  MockHomeScreenInteractor.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import XCTest
@testable import MovieDBApp

class MockHomeScreenInteractor: HomeScreenInteractor {
    
    init(interactor: HomeScreenInteractor) {
        super.init()
        self.presenter = interactor.presenter
	}
}
