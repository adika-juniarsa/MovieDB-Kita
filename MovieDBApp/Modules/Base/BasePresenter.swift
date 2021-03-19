//
//  BasePresenter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation

class BasePresenter: BaseViewToPresenterProtocol, BaseInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var viewBase: BasePresenterToViewProtocol?
    var interactorBase: BasePresenterToInteractorProtocol?
    var routerBase: BasePresenterToRouterProtocol?
    
    @objc func viewDidLoad() {
        viewBase?.setupView()
    }
}
