//
//  ReviewListContract.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

protocol ReviewListPresenterToViewProtocol: class {
    var movieId: Int? { get set }
    func setupTableView()
    func reloadTable()
    func setupPullRefresh()
    func endRefresh()
}

protocol ReviewListPresenterToInteractorProtocol: class {
    var presenter: ReviewListInteractorToPresenterProtocol? { get set }
    func fetchUserReview(withParams params: GetUserReviewsRequest)
}

protocol ReviewListInteractorToPresenterProtocol: class {
    func successFetchReview(withData data: UserReviews)
    func failedFetchList(withError error: ErrorAPI)
}

protocol ReviewListViewToPresenterProtocol: class {
    var view: ReviewListPresenterToViewProtocol? { get set }
    var interactor: ReviewListPresenterToInteractorProtocol? { get set }
    var router: ReviewListPresenterToRouterProtocol? { get set }
    
    func numberOfRowsInSection() -> Int
    func cellForRowAt(index: Int) -> Review?
    func willDisplay(indexPathRow: Int)
    func refreshUserReview()
}

protocol ReviewListPresenterToRouterProtocol: class {
    static func createModule() -> ReviewListViewController
    // TODO: Declare Presenter to Router methods
}
