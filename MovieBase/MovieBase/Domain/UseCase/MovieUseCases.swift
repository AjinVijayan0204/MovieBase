//
//  MovieUseCases.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieUseCases: MovieRepository{
    
    var repo: MovieRepository
    
    func getMovies() async throws-> [MovieCardModel] {
        try await repo.getMovies()
    }
    
    
}
