//
//  HomeScreenInteractor.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 19/03/21.
//  
//

import Foundation

class HomeScreenInteractor: HomeScreenPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: HomeScreenInteractorToPresenterProtocol?
    
    func getPopular(withParams params: GetMoviesRequest) {
        let API = ApiMovies.getPopularMovies(request: params)
        Services.instance.requestWithURL(urlString: API.path, parameters: API.parameter) { (data) in
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                do {
                    let json = try decoder.decode(DiscoverMovies.self, from: data)
                    self.presenter?.successFetchMovies(withData: json)
                } catch {
                    var errorApi = ErrorAPI()
                    errorApi.statusMessage = error.localizedDescription
                    self.presenter?.failedFetchMovies(withError: errorApi)
                }
            }
        } exception: { (error) in
            self.presenter?.failedFetchMovies(withError: error)
        }
    }
}
