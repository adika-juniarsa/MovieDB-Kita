//
//  ReviewListPresenter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

class ReviewListPresenter: BasePresenter, ReviewListViewToPresenterProtocol, ReviewListInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var view: ReviewListPresenterToViewProtocol?
    var interactor: ReviewListPresenterToInteractorProtocol?
    var router: ReviewListPresenterToRouterProtocol?
    var page: Int = 1
    var totalPages: Int = 0
    var reviews: [Review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.setupTableView()
        view?.setupPullRefresh()
        viewBase?.showSpinnerView()
        fetchUserReview()
    }
    
    func fetchUserReview() {
        let params = GetUserReviewsRequest()
        params.page = String(page)
        params.id = String(view?.movieId ?? 0)
        interactor?.fetchUserReview(withParams: params)
    }
    
    func refreshUserReview() {
        page = 1
        reviews.removeAll()
        fetchUserReview()
    }
    
    func successFetchReview(withData data: UserReviews) {
        viewBase?.removeSpinnerView()
        reviews.append(contentsOf: data.results)
        checkIfEmptyView()
        totalPages = data.totalPages ?? 0
        view?.reloadTable()
    }
    
    func numberOfRowsInSection() -> Int {
        return reviews.count
    }
    
    func cellForRowAt(index: Int) -> Review? {
        guard reviews.indices.contains(index) else { return nil }
        return reviews[index]
    }
    
    func willDisplay(indexPathRow: Int) {
        let lastRow = self.reviews.count - 1
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
        
        fetchUserReview()
    }
    
    func failedFetchList(withError error: ErrorAPI) {
        viewBase?.removeSpinnerView()
        viewBase?.showErrorMessage(error.statusMessage ?? "")
    }
    
    func checkIfEmptyView() {
        if reviews.isEmpty {
            viewBase?.setEmptyStateView(withMessage: "No Reviews Yet!")
        } else {
            viewBase?.removeEmptyStateView()
        }
    }
}
