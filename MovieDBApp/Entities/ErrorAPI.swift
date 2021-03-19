//
//  ErrorAPI.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 18/03/21.
//

import Foundation

struct ErrorAPI: Codable {
    var statusCode: Int?
    var statusMessage: String?
    var success: Bool?
    
    enum CodingKeys : String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
