//
//  FavoriteListContract.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import UIKit

protocol FavoriteListPresenterToViewProtocol: class {
    func setupTableView()
    func reloadTableView()
}

protocol FavoriteListPresenterToInteractorProtocol: class {
    var presenter: FavoriteListInteractorToPresenterProtocol? { get set }
    func fetchFavoriteList()
}

protocol FavoriteListInteractorToPresenterProtocol: class {
    func successFetchFavorites(withData data: [Result])
}

protocol FavoriteListViewToPresenterProtocol: class {
    var view: FavoriteListPresenterToViewProtocol? { get set }
    var interactor: FavoriteListPresenterToInteractorProtocol? { get set }
    var router: FavoriteListPresenterToRouterProtocol? { get set }
    
    func viewWillAppear()
    func showDetailPage(withIndex index: Int)
    func numberOfRowsInSection() -> Int
    func cellForRowAt(index: Int) -> Result?
}

protocol FavoriteListPresenterToRouterProtocol: class {
    static func createModule() -> FavoriteListViewController
    func gotoMoviesDetail(withMovie movie: Result)
}
