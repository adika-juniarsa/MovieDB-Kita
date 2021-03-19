//
//  HomeScreenPresenter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation

class HomeScreenPresenter: BasePresenter, HomeScreenViewToPresenterProtocol, HomeScreenInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var view: HomeScreenPresenterToViewProtocol?
    var interactor: HomeScreenPresenterToInteractorProtocol?
    var router: HomeScreenPresenterToRouterProtocol?
    var page: Int = 1
    var movies: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.setupTableView()
        viewBase?.showSpinnerView()
        fetchPopularMovies()
    }
    
    func failedFetchMovies(withError error: ErrorAPI) {
        viewBase?.removeSpinnerView()
        viewBase?.showErrorMessage(error.statusMessage ?? "")
    }
    
    func successFetchMovies(withData data: DiscoverMovies?) {
        viewBase?.removeSpinnerView()
        guard let data = data else { return }
        movies.append(contentsOf: data.results)
        checkIfEmptyView()
        view?.reloadTableView()
    }
    
    func checkIfEmptyView() {
        if movies.isEmpty {
            viewBase?.setEmptyStateView(withMessage: "No Genre Yet!")
        } else {
            viewBase?.removeEmptyStateView()
        }
    }
    
    func fetchPopularMovies() {
        let params = GetMoviesRequest()
        params.page = String(page)
        interactor?.getPopular(withParams: params)
    }
    
    func getUpcoming() {
        router?.gotoUpcoming()
    }
    
    func getPopular() {
        router?.gotoPopular()
    }
    
    func getTopRated() {
        router?.gotoTopRated()
    }
    
    func getNowPlaying() {
        router?.gotoNowPlaying()
    }
    
    func showDetailPage(withIndex index: Int) {
        guard movies.indices.contains(index) else { return }
        router?.gotoMoviesDetail(withMovie: movies[index])
    }
    
    func cellForRowAt(index: Int) -> Result? {
        guard movies.indices.contains(index) else { return nil }
        return movies[index]
    }
    
    func numberOfRowsInSection() -> Int {
        return movies.count
    }
    
    func getCategory() {
        router?.gotoCategoryPage()
    }
    
    func openFavorite() {
        router?.openFavorite()
    }
}
