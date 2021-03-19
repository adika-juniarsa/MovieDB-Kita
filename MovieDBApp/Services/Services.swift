//
//  Services.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 16/03/21.
//

import Foundation

typealias SuccessResponse = (Data) -> Void
typealias ErrorResponse = (ErrorAPI) -> Void

public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    public static let connect = HTTPMethod(rawValue: "CONNECT")
    public static let delete = HTTPMethod(rawValue: "DELETE")
    public static let get = HTTPMethod(rawValue: "GET")
    public static let head = HTTPMethod(rawValue: "HEAD")
    public static let options = HTTPMethod(rawValue: "OPTIONS")
    public static let patch = HTTPMethod(rawValue: "PATCH")
    public static let post = HTTPMethod(rawValue: "POST")
    public static let put = HTTPMethod(rawValue: "PUT")
    public static let trace = HTTPMethod(rawValue: "TRACE")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

class Services {
    
    static let instance = Services()
    
    func requestWithURL(urlString: String, parameters: [String: Any], success: @escaping SuccessResponse, exception: @escaping ErrorResponse) {
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = []
        
        for (key, value) in parameters {
            guard let value = value as? String else { return }
            urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
        }
        
        guard let queryURL = urlComponents.url else { return }
        print(queryURL)
        let request = URLRequest(url: queryURL)
        fetchedDataByDataTask(from: request, success: success, exception: exception)
    }
    
    private func fetchedDataByDataTask(from request: URLRequest, success: @escaping SuccessResponse, exception: @escaping ErrorResponse) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                var errorApi = ErrorAPI()
                errorApi.statusMessage = error.localizedDescription
                exception(errorApi)
            } else if let data = data {
                let decoder = JSONDecoder()
                let json = try? decoder.decode(ErrorAPI.self, from: data)
                if json?.success == false {
                    exception(json!)
                }
                success(data)
            }
        }
        task.resume()
    }
}

