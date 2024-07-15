//
//  MovieModels.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieCardModel: Codable, Hashable{
    let movieId: Int
    let originalTitle: String
    let posterPath: String
}
