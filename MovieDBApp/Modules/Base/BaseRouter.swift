//
//  BaseRouter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation
import UIKit

class BaseRouter: BasePresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var viewBase: BaseViewController?
    
    // MARK: Static methods
    
    static func createBaseModule() -> BaseViewController {
        let viewController = BaseViewController(nibName: "Base", bundle: nil)
        let presenter: BaseViewToPresenterProtocol & BaseInteractorToPresenterProtocol = BasePresenter()
        let router = BaseRouter()
        let interactor = BaseInteractor()
        
        viewController.presenterBase = presenter
        presenter.viewBase = viewController
        presenter.routerBase = router
        presenter.interactorBase = interactor
        router.viewBase = viewController
        interactor.presenterBase = presenter
        
        return viewController
    }
}
