//
//  MovieAPI.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieAPIImpl: MovieRepository{
    
    
    func getMovies() async throws-> [Movie] {
        print("movie")
        let url = URL(string: "https://api.themoviedb.org/3/tv/popular")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MWU1ZjZiZDA4OWYwMmIzZGYyMGUwOGNlMjIyM2Q3MSIsIm5iZiI6MTcyMDQ2MzA5OC4wMjA5MDIsInN1YiI6IjY2ODc5MzBmMzRhNTQzOTA0ZjFjZTFiYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yMSzZzyGZ1DgPSWofuAgdz3OgMCY_MMhOHl2CXHIe_I"
        ]
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let movies = try? JSONDecoder().decode(MovieResponse.self, from: data)
        guard let movies = movies?.result else { return [Movie]() }
        return movies
    }
    
    
}
