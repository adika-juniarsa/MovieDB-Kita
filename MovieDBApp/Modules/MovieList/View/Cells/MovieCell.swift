//
//  MovieCell.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import UIKit

protocol MovieCellDelegate: class {
    func showDetailPage(withIndex index: Int)
}

class MovieCell: BaseViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBox: UIView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    weak var delegate: MovieCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBox.applyShadow()
    }
    
    func setupView(result: Result?) {
        guard let result = result else { return }
        labelTitle.text = result.title
        labelDate.text = result.releaseDate
        labelDescription.text = result.overview
        imageMovie.downloaded(from: "\(API.imageRoot)\(result.posterPath ?? "")")
        imageMovie.contentMode = .scaleAspectFit
    }
    
    @IBAction func buttonActionTouchUp(_ sender: Any) {
        delegate?.showDetailPage(withIndex: self.tag)
    }
}
