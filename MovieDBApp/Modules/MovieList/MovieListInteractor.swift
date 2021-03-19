//
//  MovieListInteractor.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation

class MovieListInteractor: MovieListPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: MovieListInteractorToPresenterProtocol?
    
    func fetchMovieList(withParams params: GetMovieListByGenreRequest) {
        let API = ApiMovies.getMovieListByGenre(request: params)
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
    
    func getNowPlaying(withParams params: GetMoviesRequest) {
        let API = ApiMovies.getGetNowPlaying(request: params)
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
    
    func getUpcoming(withParams params: GetMoviesRequest) {
        let API = ApiMovies.getUpcoming(request: params)
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
    
    func getTopRated(withParams params: GetMoviesRequest) {
        let API = ApiMovies.getTopRatedMovies(request: params)
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
