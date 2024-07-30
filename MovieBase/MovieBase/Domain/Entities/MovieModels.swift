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

class MovieDetailModel{
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
    
    var releaseYear: String{
        return String(releaseDate[..<releaseDate.index(releaseDate.startIndex, offsetBy: 4)]) 
    }
    var likedPercentage: Int{
        return  Int(((voteAvg/10) * 100).rounded())
    }
    var duration: String{
        return "\(Int(runtime/60)) hr \(Int(runtime.truncatingRemainder(dividingBy: 60))) min"
    }
    
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


