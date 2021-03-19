//
//  GetUserReviewsRequest.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//  
//

import Foundation

class GetUserReviewsRequest: BaseRequest {
    
    var apiKey: String = API.apiKey
    var page: String?
    var id: String?
    
    override func buildForParameterAPI() -> [String : AnyObject] {
        var parameters = super.buildForParameterAPI()
        parameters["api_key"] = apiKey as AnyObject
        parameters["page"] = page as AnyObject
        return parameters
    }
}
