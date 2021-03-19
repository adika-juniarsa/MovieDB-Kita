//
//  GenreListInteractor.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation

class GenreListInteractor: GenreListPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: GenreListInteractorToPresenterProtocol?
    
    func fetchGenreList(params: GetGenreListRequest) {
        let API = ApiMovies.getGenreList(request: params)
        Services.instance.requestWithURL(urlString: API.path, parameters: API.parameter) { (data) in
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                let json = try? decoder.decode(GenreList.self, from: data)
                self.presenter?.fetchSuccess(list: json)
            }
        } exception: { (error) in
            self.presenter?.failedFetchList(withError: error)
        }
    }
}
