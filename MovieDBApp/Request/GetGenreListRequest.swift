//
//  GetGenreListRequest.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation

class GetGenreListRequest: BaseRequest {
    
    var apiKey: String = API.apiKey
    
    override func buildForParameterAPI() -> [String : AnyObject] {
        var parameters = super.buildForParameterAPI()
        parameters["api_key"] = apiKey as AnyObject
        return parameters
    }
}
