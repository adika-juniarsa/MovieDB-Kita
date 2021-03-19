//
//  MockHomeScreenRouter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import XCTest
@testable import MovieDBApp

class MockHomeScreenRouter: HomeScreenRouter {
    
    var isOpenFavorite: Bool = false
    var isOpen: Bool = false
    
    init(router: HomeScreenRouter) {
        super.init()
        self.view = router.view
    }
    
    override func openFavorite() {
        isOpenFavorite = true
    }
    
    override func gotoPopular() {
        isOpen = true
    }
    
    override func gotoUpcoming() {
        isOpen = true
    }
    
    override func gotoTopRated() {
        isOpen = true
    }
    
    override func gotoNowPlaying() {
        isOpen = true
    }
    
    override func gotoCategoryPage() {
        isOpen = true
    }
}
