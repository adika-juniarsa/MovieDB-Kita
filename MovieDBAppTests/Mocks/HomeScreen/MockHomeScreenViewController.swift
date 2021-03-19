//
//  MockHomeScreenViewController.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import XCTest
@testable import MovieDBApp

class MockHomeScreenViewController: HomeScreenViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init?(view: HomeScreenViewController) {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func setupView() {
        print("adika")
    }
}
