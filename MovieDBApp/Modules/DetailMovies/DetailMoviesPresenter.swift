//
//  DetailMoviesPresenter.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation
import CoreData
import UIKit

class DetailMoviesPresenter: BasePresenter, DetailMoviesViewToPresenterProtocol, DetailMoviesInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var view: DetailMoviesPresenterToViewProtocol?
    var interactor: DetailMoviesPresenterToInteractorProtocol?
    var router: DetailMoviesPresenterToRouterProtocol?
    var isCanBeFavorite: Bool = true
    
    override func viewDidLoad() {
        guard let data = view?.result else { return }
        view?.setupView(withMovie: data)
        checkData()
    }
    
    func buttonUserReviewTouchUp() {
        router?.gotoUserReview(movieId: view?.result?.id ?? 0)
    }
    
    func favoriteButton() {
        if isCanBeFavorite {
            createData()
        } else {
            deleteData()
        }
    }
    
    func deleteData() {
        guard let detail = view?.result else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieTable")
        do {
            let favorites = try managedObjectContext.fetch(fetchRequest)
            for item in favorites {
                let id = item.value(forKey: "id") as! Int32
                if detail.id == id {
                    managedObjectContext.delete(item)
                }
            }
            
            do {
                try managedObjectContext.save() // <- remember to put this :)
                self.view?.unfavoritesItem()
            } catch let error as NSError{
                self.viewBase?.showErrorMessage(error.localizedDescription)
            }
        }
        catch let error as NSError {
            self.viewBase?.showErrorMessage(error.localizedDescription)
        }
    }
    
    func checkData() {
        guard let detail = view?.result else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieTable")
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let id = data.value(forKey: "id") as! Int32
                if detail.id == id {
                    self.view?.favoritesItem()
                    isCanBeFavorite = false
                }
            }
        } catch {
            
        }
    }
    
    func createData() {
        guard let data = view?.result else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let movie = MovieTable(context: managedContext)
        movie.id = Int32(data.id)
        movie.imagePath = data.posterPath
        movie.overview = data.overview
        movie.releaseDate = data.releaseDate
        movie.title = data.title
        movie.voteCount = Int32(data.voteCount ?? 0)
        
        let favorite = Favorites(context: managedContext)
        favorite.favorites = movie
        
        do {
            try managedContext.save()
            self.view?.favoritesItem()
        } catch let error as NSError {
            self.viewBase?.showErrorMessage(error.localizedDescription)
        }
    }
}
