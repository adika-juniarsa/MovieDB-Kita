//
//  FavoriteListPresenter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation

class FavoriteListPresenter: BasePresenter, FavoriteListViewToPresenterProtocol, FavoriteListInteractorToPresenterProtocol {

    // MARK: Properties
    
    weak var view: FavoriteListPresenterToViewProtocol?
    var interactor: FavoriteListPresenterToInteractorProtocol?
    var router: FavoriteListPresenterToRouterProtocol?
    var items: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.setupTableView()
    }
    
    func viewWillAppear() {
        interactor?.fetchFavoriteList()
    }
    
    func successFetchFavorites(withData data: [Result]) {
        items = data
        checkIfEmptyView()
        view?.reloadTableView()
    }
    
    func checkIfEmptyView() {
        if items.isEmpty {
            viewBase?.setEmptyStateView(withMessage: "No Favorites Yet!")
        } else {
            viewBase?.removeEmptyStateView()
        }
    }
    
    func showDetailPage(withIndex index: Int) {
        guard items.indices.contains(index) else { return }
        router?.gotoMoviesDetail(withMovie: items[index])
    }
    
    func numberOfRowsInSection() -> Int {
        return items.count
    }
    
    func cellForRowAt(index: Int) -> Result? {
        guard items.indices.contains(index) else { return nil }
        return items[index]
    }
}
