//
//  GenreListPresenter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation
import UIKit

class GenreListPresenter: BasePresenter, GenreListViewToPresenterProtocol, GenreListInteractorToPresenterProtocol {
   
    // MARK: Properties
    
    weak var view: GenreListPresenterToViewProtocol?
    var interactor: GenreListPresenterToInteractorProtocol?
    var router: GenreListPresenterToRouterProtocol?
    var genreList: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.setupTableView()
        view?.setupPullRefresh()
        fetchGenreList()
    }
    
    func fetchGenreList() {
        viewBase?.showSpinnerView()
        let params = GetGenreListRequest()
        interactor?.fetchGenreList(params: params)
    }
    
    func fetchSuccess(list: GenreList?) {
        viewBase?.removeSpinnerView()
        guard let list = list else { return }
        genreList = list.genres
        view?.reloadTable()
    }
    
    func failedFetchList(withError error: ErrorAPI) {
        viewBase?.removeSpinnerView()
        viewBase?.showErrorMessage(error.statusMessage ?? "")
    }
    
    func cellForRowAt(index: Int) -> String {
        guard genreList.indices.contains(index) else { return "" }
        return genreList[index].name ?? ""
    }
    
    func numberOfRowsInSection(withTableView tableView: UITableView) -> Int {
        checkIfEmptyView(withTableView: tableView)
        return genreList.count
    }
    
    func checkIfEmptyView(withTableView tableView: UITableView) {
        if genreList.isEmpty {
            viewBase?.setEmptyStateView(withMessage: "No Genre Yet!")
        } else {
            viewBase?.removeEmptyStateView()
        }
    }
    
    func selected(index: Int) {
        guard genreList.indices.contains(index) else { return }
        router?.gotoMovieList(movieId: genreList[index].id ?? 0)
    }
}
