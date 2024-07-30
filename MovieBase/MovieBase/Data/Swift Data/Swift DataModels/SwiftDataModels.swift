//
//  SwiftDataModels.swift
//  MovieBase
//
//  Created by Ajin on 30/07/24.
//

import Foundation
import SwiftData

@Model
class MovieDataModel{
    let movieId: Int
    let adult: Bool
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let title: String
    let runtime: Double
    let posterPath: String
    let voteAvg: Double
    
    init(movieId: Int, adult: Bool, originalLanguage: String, originalTitle: String, overview: String, releaseDate: String, title: String, runtime: Double, posterPath: String, voteAvg: Double) {
        self.movieId = movieId
        self.adult = adult
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.releaseDate = releaseDate
        self.title = title
        self.runtime = runtime
        self.posterPath = posterPath
        self.voteAvg = voteAvg
    }
}
