//
//  Application.swift
//  MovieBase
//
//  Created by Ajin on 11/07/24.
//

import Foundation
import UIKit

struct Screen{
    static let shared = Screen()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
}

enum MovieEndpoint: String{
    case popularMovies = "movie/popular"
    case nowPlaying = "movie/now_playing"
    case topRated = "movie/top_rated"
}
