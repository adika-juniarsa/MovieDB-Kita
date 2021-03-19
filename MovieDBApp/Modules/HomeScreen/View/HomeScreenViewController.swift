//
//  HomeScreenViewController.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import UIKit

class HomeScreenViewController: BaseViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    let buttonCellFooter = "ButtonCellFooter"
    let movieCell = "MovieCell"
    
    var presenter: HomeScreenViewToPresenterProtocol?
    
    override func setupView() {
        super.setupView()
        self.title = "MovieDB APP"
        self.addNavigationBarButton(imageName: "star.fill", direction:.right)
    }
    
    override func rigthMenuButtonAction() {
        presenter?.openFavorite()
    }
}

extension HomeScreenViewController: HomeScreenPresenterToViewProtocol {
    
    func setupTableView() {
        tableView.register(UINib(nibName: movieCell, bundle: nil), forCellReuseIdentifier: movieCell)
        tableView.register(UINib(nibName: buttonCellFooter, bundle: nil), forHeaderFooterViewReuseIdentifier: buttonCellFooter)
        tableView.separatorStyle = .none
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCell, for: indexPath) as! MovieCell
        cell.setupView(result: presenter?.cellForRowAt(index: indexPath.row))
        cell.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: buttonCellFooter) as! ButtonCellFooter
        view.delegate = self
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
}

extension HomeScreenViewController: ButtonCellFooterDelegate {
    
    func getPopular() {
        presenter?.getPopular()
    }
    
    func getUpcoming() {
        presenter?.getUpcoming()
    }
    
    func getTopRated() {
        presenter?.getTopRated()
    }
    
    func getNowPlaying() {
        presenter?.getNowPlaying()
    }
    
    func getCategory() {
        presenter?.getCategory()
    }
}

extension HomeScreenViewController: MovieCellDelegate {
    
    func showDetailPage(withIndex index: Int) {
        presenter?.showDetailPage(withIndex: index)
    }
}
