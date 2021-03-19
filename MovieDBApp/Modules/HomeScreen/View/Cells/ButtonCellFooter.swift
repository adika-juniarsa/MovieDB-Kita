//
//  ButtonCellFooter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//

import UIKit

protocol ButtonCellFooterDelegate: class {
    func getNowPlaying()
    func getTopRated()
    func getUpcoming()
    func getPopular()
    func getCategory()
}

class ButtonCellFooter: UITableViewHeaderFooterView {

    weak var delegate: ButtonCellFooterDelegate?
    
    @IBAction func buttonNowPlayingTouchUp(_ sender: Any) {
        delegate?.getNowPlaying()
    }
    
    @IBAction func buttonTopRatedTouchUp(_ sender: Any) {
        delegate?.getTopRated()
    }
    
    @IBAction func buttonUpcomingTouchUp(_ sender: Any) {
        delegate?.getUpcoming()
    }
    
    @IBAction func buttonPopularTouchUp(_ sender: Any) {
        delegate?.getPopular()
    }
    
    @IBAction func buttonCategoryTouchUp(_ sender: Any) {
        delegate?.getCategory()
    }
}
