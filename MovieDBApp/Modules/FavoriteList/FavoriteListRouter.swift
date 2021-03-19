//
//  FavoriteListRouter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import UIKit

class FavoriteListRouter: FavoriteListPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: FavoriteListViewController?
    
    // MARK: Static methods
    
    static func createModule() -> FavoriteListViewController {
        let viewController = FavoriteListViewController(nibName: "FavoriteList", bundle: nil)
        let presenter = FavoriteListPresenter()
        let router = FavoriteListRouter()
        let interactor = FavoriteListInteractor()
        
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
