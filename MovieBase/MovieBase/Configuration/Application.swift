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

enum MovieEndpoint: RawRepresentable{
    
    init?(rawValue: String) {
        nil
    }
    
    var rawValue: String{
        switch self{
        case .topRated:
            return "movie/top_rated"
        case .nowPlaying:
            return "movie/now_playing"
        case .popularMovies:
            return "movie/popular"
        case .movieDetail(let id):
            return "movie/\(id)"
        }
    }
    
    case popularMovies
    case nowPlaying
    case topRated
    case movieDetail(id: Int)
}
