//
//  MovieAPI.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieAPIImpl{
    
    let webService = WebService()
    
    func getMovies(_ endPoint: MovieEndpoint) async-> [Movie] {
        
        let movieEndpoint = endPoint.rawValue
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
    
    func getMovieDetails(_ endPoint: MovieEndpoint) async-> MovieDetailResponseModel?{
        
        let movieDetailEndPoint = endPoint.rawValue
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
        ]
        do{
            let data = try await webService.makeRequest(for: movieDetailEndPoint, queryItems: queryItems)
            let movieDetailResponse = try JSONDecoder().decode(MovieDetailResponseModel.self, from: data)
            return movieDetailResponse
        }catch{
            return nil
        }
        
    }
}
