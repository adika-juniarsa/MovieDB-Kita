//
//  FavoriteListInteractor.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation
import CoreData
import UIKit

class FavoriteListInteractor: FavoriteListPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: FavoriteListInteractorToPresenterProtocol?
    
    func fetchFavoriteList() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        var list: [Result] = []
        
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieTable")
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let id = data.value(forKey: "id") as! Int32
                let title = data.value(forKey: "title") as! String
                let imagePath = data.value(forKey: "imagePath") as! String
                let overview = data.value(forKey: "overview") as! String
                let releaseDate = data.value(forKey: "releaseDate") as! String
                let voteCount = data.value(forKey: "voteCount") as! Int32
                
                let movie = Result(adult: false, backdropPath: nil, genreIDS: [], id: Int(id), originalLanguage: nil, originalTitle: nil, overview: overview, popularity: nil, posterPath: imagePath, releaseDate: releaseDate, title: title, video: false, voteAverage: nil, voteCount: Int(voteCount))
                list.append(movie)
            }
            self.presenter?.successFetchFavorites(withData: list)
        } catch {
            
        }
    }
}
