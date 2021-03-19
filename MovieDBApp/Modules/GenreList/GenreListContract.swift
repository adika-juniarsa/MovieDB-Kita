//
//  GenreListContract.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation
import UIKit

protocol GenreListPresenterToViewProtocol: class {
    func setupTableView()
    func reloadTable()
    func setupPullRefresh()
}

protocol GenreListPresenterToInteractorProtocol: class {
    var presenter: GenreListInteractorToPresenterProtocol? { get set }
    func fetchGenreList(params: GetGenreListRequest)
}

protocol GenreListInteractorToPresenterProtocol: class {
    func fetchSuccess(list: GenreList?)
    func failedFetchList(withError error: ErrorAPI)
}

protocol GenreListViewToPresenterProtocol: class {
    var view: GenreListPresenterToViewProtocol? { get set }
    var interactor: GenreListPresenterToInteractorProtocol? { get set }
    var router: GenreListPresenterToRouterProtocol? { get set }
    
    func numberOfRowsInSection(withTableView tableView: UITableView) -> Int
    func cellForRowAt(index: Int) -> String
    func fetchGenreList()
    func selected(index: Int)
}

protocol GenreListPresenterToRouterProtocol: class {
    static func createModule() -> GenreListViewController
    func gotoMovieList(movieId: Int)
}
