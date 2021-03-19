//
//  HomeScreenRouter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import UIKit

class HomeScreenRouter: HomeScreenPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: HomeScreenViewController?
    
    // MARK: Static methods
    
    static func createModule() -> HomeScreenViewController {
        let viewController = HomeScreenViewController(nibName: "HomeScreen", bundle: nil)
        let presenter = HomeScreenPresenter()
        let router = HomeScreenRouter()
        let interactor = HomeScreenInteractor()
        
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
    
    func gotoCategoryPage() {
        let vc = GenreListRouter.createModule()
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func gotoPopular() {
        let vc = MovieListRouter.createModule()
        vc.type = .popular
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func gotoUpcoming() {
        let vc = MovieListRouter.createModule()
        vc.type = .upcoming
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func gotoTopRated() {
        let vc = MovieListRouter.createModule()
        vc.type = .topRated
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func gotoNowPlaying() {
        let vc = MovieListRouter.createModule()
        vc.type = .nowPlaying
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func gotoMoviesDetail(withMovie movie: Result) {
        let vc = DetailMoviesRouter.createModule()
        vc.result = movie
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openFavorite() {
        let vc = FavoriteListRouter.createModule()
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
