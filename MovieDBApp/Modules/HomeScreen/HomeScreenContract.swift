//
//  HomeScreenContract.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import UIKit

protocol HomeScreenPresenterToViewProtocol: class {
    func setupTableView()
    func reloadTableView()
}

protocol HomeScreenPresenterToInteractorProtocol: class {
    var presenter: HomeScreenInteractorToPresenterProtocol? { get set }
    func getPopular(withParams params: GetMoviesRequest)
}

protocol HomeScreenInteractorToPresenterProtocol: class {
    func successFetchMovies(withData data: DiscoverMovies?)
    func failedFetchMovies(withError error: ErrorAPI)
}

protocol HomeScreenViewToPresenterProtocol: class {
    var view: HomeScreenPresenterToViewProtocol? { get set }
    var interactor: HomeScreenPresenterToInteractorProtocol? { get set }
    var router: HomeScreenPresenterToRouterProtocol? { get set }
    
    func getNowPlaying()
    func getTopRated()
    func getUpcoming()
    func getPopular()
    func getCategory()
    func openFavorite()
    
    func showDetailPage(withIndex index: Int)
    func numberOfRowsInSection() -> Int
    func cellForRowAt(index: Int) -> Result?
}

protocol HomeScreenPresenterToRouterProtocol: class {
    static func createModule() -> HomeScreenViewController
    func gotoCategoryPage()
    func gotoNowPlaying()
    func gotoTopRated()
    func gotoUpcoming()
    func gotoPopular()
    func gotoMoviesDetail(withMovie movie: Result)
    func openFavorite()
}
