//
//  Genre.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 16/03/21.
//  
//

import Foundation

struct GenreList: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    var id: Int?
    var name: String?
}
