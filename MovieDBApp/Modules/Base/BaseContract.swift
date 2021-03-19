//
//  BaseContract.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation
import UIKit

protocol BasePresenterToViewProtocol: class {
    func setupView()
    func showSpinnerView()
    func removeSpinnerView()
    func setEmptyStateView(withMessage message: String)
    func removeEmptyStateView()
    func showErrorMessage(_ message: String)
    func removeSpinnerLoading()
    func addSpinnerInfinityScroll()
    func rigthMenuButtonAction()
}

protocol BasePresenterToInteractorProtocol: class {
    var presenterBase: BaseInteractorToPresenterProtocol? { get set }
    // TODO: Declare Presenter to Interactor methods
}

protocol BaseInteractorToPresenterProtocol: class {
    // TODO: Declare Interactor to Presenter methods
}

protocol BaseViewToPresenterProtocol: class {
    var viewBase: BasePresenterToViewProtocol? { get set }
    var interactorBase: BasePresenterToInteractorProtocol? { get set }
    var routerBase: BasePresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol BasePresenterToRouterProtocol: class {
    static func createBaseModule() -> BaseViewController
    // TODO: Declare Presenter to Router methods
}
