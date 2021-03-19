//
//  ReviewListInteractor.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation

class ReviewListInteractor: ReviewListPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: ReviewListInteractorToPresenterProtocol?
    
    func fetchUserReview(withParams params: GetUserReviewsRequest) {
        let API = ApiMovies.getUserReviews(request: params)
        Services.instance.requestWithURL(urlString: API.path, parameters: API.parameter) { (data) in
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                do {
                    let json = try decoder.decode(UserReviews.self, from: data)
                    self.presenter?.successFetchReview(withData: json)
                } catch let error {
                    var errorApi = ErrorAPI()
                    errorApi.statusMessage = error.localizedDescription
                    self.presenter?.failedFetchList(withError: errorApi)
                }
            }
        } exception: { (error) in
            self.presenter?.failedFetchList(withError: error)
        }
    }
}
