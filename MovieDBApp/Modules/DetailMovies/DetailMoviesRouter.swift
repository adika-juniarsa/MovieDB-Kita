//
//  DetailMoviesRouter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

class DetailMoviesRouter: DetailMoviesPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: DetailMoviesViewController?
    
    // MARK: Static methods
    
    static func createModule() -> DetailMoviesViewController {
        let viewController = DetailMoviesViewController(nibName: "DetailMovies", bundle: nil)
        let presenter = DetailMoviesPresenter()
        let router = DetailMoviesRouter()
        let interactor = DetailMoviesInteractor()
        
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
    
    func gotoUserReview(movieId: Int) {
        let vc = ReviewListRouter.createModule()
        vc.movieId = movieId
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
