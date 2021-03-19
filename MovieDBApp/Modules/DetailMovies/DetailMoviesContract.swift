//
//  DetailMoviesContract.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

protocol DetailMoviesPresenterToViewProtocol: class {
    var result: Result? { get set }
    func setupView(withMovie movie: Result)
    func favoritesItem()
    func unfavoritesItem()
}

protocol DetailMoviesPresenterToInteractorProtocol: class {
    var presenter: DetailMoviesInteractorToPresenterProtocol? { get set }
    // TODO: Declare Presenter to Interactor methods
}

protocol DetailMoviesInteractorToPresenterProtocol: class {
    // TODO: Declare Interactor to Presenter methods
}

protocol DetailMoviesViewToPresenterProtocol: class {
    var view: DetailMoviesPresenterToViewProtocol? { get set }
    var interactor: DetailMoviesPresenterToInteractorProtocol? { get set }
    var router: DetailMoviesPresenterToRouterProtocol? { get set }
    
    func buttonUserReviewTouchUp()
    func favoriteButton()
}

protocol DetailMoviesPresenterToRouterProtocol: class {
    static func createModule() -> DetailMoviesViewController
    func gotoUserReview(movieId: Int)
}
