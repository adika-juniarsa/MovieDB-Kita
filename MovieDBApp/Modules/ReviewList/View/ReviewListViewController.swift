//
//  ReviewListViewController.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import UIKit

class ReviewListViewController: BaseViewController {
    
    // MARK: Properties
    
    let reviewCell = "ReviewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl = UIRefreshControl()
    var movieId: Int?
    var presenter: ReviewListViewToPresenterProtocol?
    
    override func setupView() {
        self.title = "User Reviews"
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

extension ReviewListViewController: ReviewListPresenterToViewProtocol {
    
    func setupTableView() {
        tableView.register(UINib(nibName: reviewCell, bundle: nil), forCellReuseIdentifier: reviewCell)
    }
    
    func reloadTable() {
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
        presenter?.refreshUserReview()
    }
}

extension ReviewListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reviewCell, for: indexPath) as! ReviewCell
        cell.setupView(withData: presenter?.cellForRowAt(index: indexPath.row))
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
