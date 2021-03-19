//
//  ApiMovies.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 16/03/21.
//  
//

enum ApiMovies {
    
    case getGenreList(request: GetGenreListRequest)
    case getMovieListByGenre(request: GetMovieListByGenreRequest)
    case getUserReviews(request: GetUserReviewsRequest)
    case getPopularMovies(request: GetMoviesRequest)
    case getTopRatedMovies(request: GetMoviesRequest)
    case getGetNowPlaying(request: GetMoviesRequest)
    case getUpcoming(request: GetMoviesRequest)
    
    var path: String {
        switch self {
        case .getGenreList:
            return "\(API.baseURL)/genre/movie/list"
        case .getMovieListByGenre:
            return "\(API.baseURL)/discover/movie"
        case .getUserReviews(let request):
            return "\(API.baseURL)/movie/\(request.id!)/reviews"
        case .getPopularMovies:
            return "\(API.baseURL)/movie/popular"
        case .getTopRatedMovies:
            return "\(API.baseURL)/movie/top_rated"
        case .getGetNowPlaying:
            return "\(API.baseURL)/movie/now_playing"
        case .getUpcoming:
            return "\(API.baseURL)/movie/upcoming"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getGenreList:
            return .get
        case .getMovieListByGenre:
            return .get
        case .getUserReviews:
            return .get
        case .getPopularMovies:
            return .get
        case .getTopRatedMovies:
            return .get
        case .getGetNowPlaying:
            return .get
        case .getUpcoming:
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .getGenreList(let request):
            return request.buildForParameterAPI()
        case .getMovieListByGenre(let request):
            return request.buildForParameterAPI()
        case .getUserReviews(let request):
            return request.buildForParameterAPI()
        case .getPopularMovies(let request):
            return request.buildForParameterAPI()
        case .getTopRatedMovies(let request):
            return request.buildForParameterAPI()
        case .getGetNowPlaying(let request):
            return request.buildForParameterAPI()
        case .getUpcoming(let request):
            return request.buildForParameterAPI()
        }
    }
}
