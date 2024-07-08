//
//  MovieReposImpl.swift
//  MovieBase
//
//  Created by Ajin on 09/07/24.
//

import Foundation

struct MovieReposImpl: MovieRepository{
    
    var dataSource: MovieRepository
    
    func getMovies() async throws -> [Movie] {
        try await dataSource.getMovies()
    }
    
    
}
