//
//  GenreListViewController.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation
import UIKit

class GenreListViewController: BaseViewController {
    
    // MARK: Properties
    
    let genreCell = "GenreCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl = UIRefreshControl()
    var presenter: GenreListViewToPresenterProtocol?
}

extension GenreListViewController: GenreListPresenterToViewProtocol {
    
    func setupTableView() {
        tableView.register(UINib(nibName: genreCell, bundle: nil), forCellReuseIdentifier: genreCell)
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
    
    @objc func refresh(_ sender: AnyObject) {
        presenter?.fetchGenreList()
    }
}

extension GenreListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfRowsInSection(withTableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: genreCell, for: indexPath) as! GenreCell
        cell.delegate = self
        cell.tag = indexPath.row
        cell.labelGenre.text = presenter!.cellForRowAt(index: indexPath.row)
        return cell
    }
}

extension GenreListViewController: GenreCellDelegate {
    
    func selected(withIndex index: Int) {
        presenter?.selected(index: index)
    }
}
