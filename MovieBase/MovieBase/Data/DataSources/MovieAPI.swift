//
//  MovieAPI.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieAPIImpl: MovieRepository{
    
    
    func getMovies() async throws-> [Movie] {
        let movieUrl = Config().appUrl + "movie/popular"
        let url = URL(string: movieUrl)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        let authorisation = "Bearer " + Config().apiKey
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": authorisation
        ]

        let (data, _) = try await URLSession.shared.data(for: request)
        let movies = try? JSONDecoder().decode(MovieResponse.self, from: data)
        guard let movies = movies?.result else { return [Movie]() }
        return movies
    }
    
    
}
