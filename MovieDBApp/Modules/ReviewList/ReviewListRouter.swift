//
//  ReviewListRouter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

class ReviewListRouter: ReviewListPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: ReviewListViewController?
    
    // MARK: Static methods
    
    static func createModule() -> ReviewListViewController {
        let viewController = ReviewListViewController(nibName: "ReviewList", bundle: nil)
        let presenter = ReviewListPresenter()
        let router = ReviewListRouter()
        let interactor = ReviewListInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        viewController.presenterBase = presenter
        presenter.viewBase = viewController
        
        return viewController
    }
}
