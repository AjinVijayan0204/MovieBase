//
//  DataModels.swift
//  MovieBase
//
//  Created by Ajin on 15/07/24.
//

import Foundation

struct Movie: Codable, Hashable{
    let movieId: Int
    let originalTitle: String
    let posterPath: String
    enum CodingKeys: String, CodingKey{
        case movieId = "id"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
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

struct MovieDetailResponseModel: Codable{
    let adult: Bool
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let title: String
    let runtime: Double
    let posterPath: String
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case releaseDate = "release_date"
        case title = "title"
        case runtime = "runtime"
        case posterPath = "poster_path"
    }
    
}
