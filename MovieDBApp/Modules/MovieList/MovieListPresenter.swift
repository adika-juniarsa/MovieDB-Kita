//
//  MovieListPresenter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

enum moviesCategory {
    case popular
    case upcoming
    case topRated
    case nowPlaying
    case discover
}

class MovieListPresenter: BasePresenter, MovieListViewToPresenterProtocol, MovieListInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var view: MovieListPresenterToViewProtocol?
    var interactor: MovieListPresenterToInteractorProtocol?
    var router: MovieListPresenterToRouterProtocol?
    var page: Int = 1
    var totalPages: Int = 0
    var results: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.setupTableView()
        view?.setupPullRefresh()
        viewBase?.showSpinnerView()
        checkTypeList()
    }
    
    func checkTypeList() {
        switch view?.type {
        case .discover:
            fetchMovieList()
        case .popular:
            fetchPopularMovies()
        case .nowPlaying:
            fetchNowPlayingMovies()
        case .topRated:
            fetchTopRatedMovies()
        case .upcoming:
            fetchUpcomingMovies()
        default:
            break
        }
    }
    
    func refreshMovieList() {
        page = 1
        results.removeAll()
        checkTypeList()
    }
    
    func fetchMovieList() {
        let params = GetMovieListByGenreRequest()
        params.withGenres = String(view?.genreId ?? 0)
        params.page = String(page)
        interactor?.fetchMovieList(withParams: params)
    }
    
    func successFetchMovies(withData data: DiscoverMovies?) {
        viewBase?.removeSpinnerView()
        guard let data = data else { return }
        totalPages = data.totalPages ?? 0
        results.append(contentsOf: data.results)
        checkIfEmptyView()
        view?.reloadTableView()
    }
    
    func failedFetchMovies(withError error: ErrorAPI) {
        viewBase?.removeSpinnerView()
        viewBase?.showErrorMessage(error.statusMessage ?? "")
    }
    
    func numberOfRowsInSection() -> Int {
        return results.count
    }
    
    func checkIfEmptyView() {
        if results.isEmpty {
            viewBase?.setEmptyStateView(withMessage: "No Movies List Yet!")
        } else {
            viewBase?.removeEmptyStateView()
        }
    }
    
    func cellForRowAt(index: Int) -> Result? {
        guard results.indices.contains(index) else { return nil }
        return results[index]
    }
    
    func showDetailPage(withIndex index: Int) {
        guard results.indices.contains(index) else { return }
        router?.gotoMoviesDetail(withMovie: results[index])
    }
    
    func willDisplay(indexPathRow: Int) {
        let lastRow = self.results.count - 1
        if indexPathRow == lastRow {
            self.requestMore()
        }
    }
    
    func requestMore() {
        if page == totalPages {
            view?.endRefresh()
            return
        } else {
            page += 1
            viewBase?.addSpinnerInfinityScroll()
        }
        
        checkTypeList()
    }
    
    func fetchPopularMovies() {
        let params = GetMoviesRequest()
        params.page = String(page)
        interactor?.getPopular(withParams: params)
    }
    
    func fetchUpcomingMovies() {
        let params = GetMoviesRequest()
        params.page = String(page)
        interactor?.getUpcoming(withParams: params)
    }
    
    func fetchTopRatedMovies() {
        let params = GetMoviesRequest()
        params.page = String(page)
        interactor?.getTopRated(withParams: params)
    }
    
    func fetchNowPlayingMovies() {
        let params = GetMoviesRequest()
        params.page = String(page)
        interactor?.getNowPlaying(withParams: params)
    }
}
