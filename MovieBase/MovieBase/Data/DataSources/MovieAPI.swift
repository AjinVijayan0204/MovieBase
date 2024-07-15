//
//  MovieAPI.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieAPIImpl{
    
    let webService = WebService()
    
    func getMovies() async-> [MovieCardModel] {
        
        let popularMovies = "movie/popular"
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        
        do{
            let data = try await webService.makeRequest(for: popularMovies, queryItems: queryItems)
            let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            var movies = [MovieCardModel]()
            moviesResponse?.result.forEach({ movie in
                let movie = MovieCardModel(movieId: movie.movieId,
                                           originalTitle: movie.originalTitle,
                                           posterPath: movie.posterPath)
                movies.append(movie)
            })
            
            return movies
        }catch{
            return [MovieCardModel]()
        }
    }
    
    
}
