//
//  MovieUseCases.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieIseCases: MovieRepository{
    
    var repo: MovieRepository
    
    func getMovies() async throws-> [Movie] {
        try await repo.getMovies()
    }
    
    
}
