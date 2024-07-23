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
}
