//
//  FavoriteListViewController.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import UIKit

class FavoriteListViewController: BaseViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    let movieCell = "MovieCell"
    var presenter: FavoriteListViewToPresenterProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func setupView() {
        super.setupView()
        self.title = "Favorite"
    }
    
    override func removeEmptyStateView() {
        self.tableView.isScrollEnabled = true
        self.tableView.restore()
    }
    
    override func setEmptyStateView(withMessage message: String) {
        self.tableView.isScrollEnabled = false
        self.tableView.setEmptyMessage(message)
    }
}

extension FavoriteListViewController: FavoriteListPresenterToViewProtocol {
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: movieCell, bundle: nil), forCellReuseIdentifier: movieCell)
    }
}

extension FavoriteListViewController: UITableViewDataSource, UITableViewDelegate {
    
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
}

extension FavoriteListViewController: MovieCellDelegate {
    
    func showDetailPage(withIndex index: Int) {
        presenter?.showDetailPage(withIndex: index)
    }
}
