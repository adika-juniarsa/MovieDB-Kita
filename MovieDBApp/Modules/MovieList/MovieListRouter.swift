//
//  MovieListRouter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

class MovieListRouter: MovieListPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: MovieListViewController?
    
    // MARK: Static methods
    
    static func createModule() -> MovieListViewController {
        let viewController = MovieListViewController(nibName: "MovieList", bundle: nil)
        let presenter = MovieListPresenter()
        let router = MovieListRouter()
        let interactor = MovieListInteractor()
        
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
    
    func gotoMoviesDetail(withMovie movie: Result) {
        let vc = DetailMoviesRouter.createModule()
        vc.result = movie
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
