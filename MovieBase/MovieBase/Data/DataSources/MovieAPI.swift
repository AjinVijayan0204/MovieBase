//
//  MovieAPI.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieAPIImpl: MovieRepository{
    
    let webService = WebService()
    
    func getMovies() async-> [Movie] {
        
        let popularMovies = "movie/popular"
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        
        do{
            let data = try await webService.makeRequest(for: popularMovies, queryItems: queryItems)
            let movies = try? JSONDecoder().decode(MovieResponse.self, from: data)
            guard let movies = movies?.result else { return [Movie]() }
            return movies
        }catch{
            return [Movie]()
        }
    }
    
    
}
