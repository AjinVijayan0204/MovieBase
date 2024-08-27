//
//  MovieAPI.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

protocol MovieApi{
    func getMovies(_ endPoint: MovieEndpoint, page: Int) async throws-> [Movie]
    func getMovieDetails(_ endPoint: MovieEndpoint) async throws-> MovieDetailResponseModel?
}

struct MovieAPIImpl: MovieApi{
    
    let webService = WebService()
    
    func getMovies(_ endPoint: MovieEndpoint, page: Int) async throws-> [Movie] {
        
        let movieEndpoint = endPoint.rawValue
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "\(page)"),
        ]
        
        do{
            let data = try await webService.makeRequest(for: movieEndpoint, queryItems: queryItems)
            let moviesResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            return moviesResponse.result
        }catch{
            throw MovieBaseErrors.invalidAccess
        }
    }
    
    func getMovieDetails(_ endPoint: MovieEndpoint) async throws-> MovieDetailResponseModel?{
        
        let movieDetailEndPoint = endPoint.rawValue
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
        ]
        do{
            let data = try await webService.makeRequest(for: movieDetailEndPoint, queryItems: queryItems)
            let movieDetailResponse = try JSONDecoder().decode(MovieDetailResponseModel.self, from: data)
            return movieDetailResponse
        }catch{
            throw MovieBaseErrors.invalidAccess
        }
        
    }
}
