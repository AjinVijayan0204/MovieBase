//
//  MovieAPI.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieAPIImpl{
    
    let webService = WebService()
    
    func getMovies() async-> [Movie] {
        
        let movieEndpoint = MovieEndpoint.popularMovies.rawValue
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        
        do{
            let data = try await webService.makeRequest(for: movieEndpoint, queryItems: queryItems)
            let moviesResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            return moviesResponse.result
        }catch{
            return [Movie]()
        }
    }
}

enum MovieEndpoint: String{
    case popularMovies = "movie/popular"
}
