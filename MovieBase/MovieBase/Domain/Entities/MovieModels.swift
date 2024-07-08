//
//  MovieModels.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct Movie: Codable, Hashable{
    let movieId: Int
    let originalTitle: String
    enum CodingKeys: String, CodingKey{
        case movieId = "id"
        case originalTitle = "original_name"
    }
}

struct MovieResponse: Codable{
    let page: Int
    let result: [Movie]
    enum CodingKeys: String, CodingKey{
        case page
        case result = "results"
    }
}
