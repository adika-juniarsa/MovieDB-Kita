//
//  MovieListViewController.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

class MovieListViewController: BaseViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    let movieCell = "MovieCell"
    
    var refreshControl = UIRefreshControl()
    var genreId: Int?
    var type: moviesCategory = .popular
    var presenter: MovieListViewToPresenterProtocol?
    
    override func setupView() {
        super.setupView()
        self.title = "Movie List"
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

extension MovieListViewController: MovieListPresenterToViewProtocol {
    
    func setupTableView() {
        tableView.register(UINib(nibName: movieCell, bundle: nil), forCellReuseIdentifier: movieCell)
        tableView.separatorStyle = .none
    }
    
    func reloadTableView() {
        self.refreshControl.endRefreshing()
        self.tableView.reloadData()
    }
    
    func setupPullRefresh() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = .systemBlue
        tableView.addSubview(refreshControl)
    }
    
    func endRefresh() {
        removeSpinnerLoading()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        presenter?.refreshMovieList()
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if tableView.visibleCells.contains(cell) {
                self.presenter?.willDisplay(indexPathRow: indexPath.row)
            }
        }
    }
}

extension MovieListViewController: MovieCellDelegate {
    
    func showDetailPage(withIndex index: Int) {
        presenter?.showDetailPage(withIndex: index)
    }
}
