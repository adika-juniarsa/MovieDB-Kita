//
//  DetailMoviesViewController.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

class DetailMoviesViewController: BaseViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelReviews: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var presenter: DetailMoviesViewToPresenterProtocol?
    var result: Result?
    
    @IBAction func buttonUserReviewTouchUp(_ sender: Any) {
        presenter?.buttonUserReviewTouchUp()
    }
    
    override func rigthMenuButtonAction() {
        presenter?.favoriteButton()
    }
}

extension DetailMoviesViewController: DetailMoviesPresenterToViewProtocol {
    
    func setupView(withMovie movie: Result) {
        self.title = "Detail"
        labelTitle.text = movie.title
        labelDate.text = movie.releaseDate
        labelReviews.text = "\(movie.voteCount ?? 0) Reviews"
        labelDescription.text = movie.overview
        imageMovie.downloaded(from: "\(API.imageRoot)\(movie.posterPath ?? "")")
        self.addNavigationBarButton(imageName: "suit.heart", direction:.right)
    }
    
    func favoritesItem() {
        self.addNavigationBarButton(imageName: "suit.heart.fill", direction:.right)
    }
    
    func unfavoritesItem() {
        self.addNavigationBarButton(imageName: "suit.heart", direction:.right)
    }
}
