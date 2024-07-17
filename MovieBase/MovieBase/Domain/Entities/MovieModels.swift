//
//  MovieModels.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieCardModel: Hashable{
    let movieId: Int
    let originalTitle: String
    let posterPath: String
}

struct MovieDetailModel{
    let adult: Bool
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let title: String
    let runtime: Double
}
