//
//  MovieListContract.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

protocol MovieListPresenterToViewProtocol: class {
    var genreId: Int? { get set }
    var type: moviesCategory { get set }
    
    func setupTableView()
    func reloadTableView()
    func setupPullRefresh()
    func endRefresh()
}

protocol MovieListPresenterToInteractorProtocol: class {
    var presenter: MovieListInteractorToPresenterProtocol? { get set }
    func fetchMovieList(withParams params: GetMovieListByGenreRequest)
    func getPopular(withParams params: GetMoviesRequest)
    func getUpcoming(withParams params: GetMoviesRequest)
    func getTopRated(withParams params: GetMoviesRequest)
    func getNowPlaying(withParams params: GetMoviesRequest)
}

protocol MovieListInteractorToPresenterProtocol: class {
    func successFetchMovies(withData data: DiscoverMovies?)
    func failedFetchMovies(withError error: ErrorAPI)
}

protocol MovieListViewToPresenterProtocol: class {
    var view: MovieListPresenterToViewProtocol? { get set }
    var interactor: MovieListPresenterToInteractorProtocol? { get set }
    var router: MovieListPresenterToRouterProtocol? { get set }
    
    func showDetailPage(withIndex index: Int)
    func numberOfRowsInSection() -> Int
    func refreshMovieList()
    func willDisplay(indexPathRow: Int)
    func cellForRowAt(index: Int) -> Result?
}

protocol MovieListPresenterToRouterProtocol: class {
    static func createModule() -> MovieListViewController
    func gotoMoviesDetail(withMovie movie: Result)
}
