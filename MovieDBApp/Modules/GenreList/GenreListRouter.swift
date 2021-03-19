//
//  GenreListRouter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation
import UIKit

class GenreListRouter: GenreListPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: GenreListViewController?
    
    // MARK: Static methods
    
    static func createModule() -> GenreListViewController {
        let viewController = GenreListViewController(nibName: "GenreList", bundle: nil)
        let presenter = GenreListPresenter()
        let router = GenreListRouter()
        let interactor = GenreListInteractor()
        
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
    
    func gotoMovieList(movieId: Int) {
        let vc = MovieListRouter.createModule()
        vc.genreId = movieId
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
