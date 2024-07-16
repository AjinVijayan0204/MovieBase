//
//  MovieUseCases.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieUseCases: MovieRepository{
    
    var repo: MovieRepository
    
    func getMovies(_ ofType: MovieEndpoint) async throws-> [MovieCardModel] {
        return (try await repo.getMovies(ofType))
    }
    
    
}
