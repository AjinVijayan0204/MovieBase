//
//  MovieUseCaseImpl.swift
//  MovieBase
//
//  Created by Ajin on 28/07/24.
//

import Foundation

struct MovieUseCasesImpl: MovieUseCases{
    
    var repo: MovieRepository
    
    func getMovies(_ ofType: MovieEndpoint, page: Int) async -> [MovieCardModel] {
        return (await repo.getMovies(ofType, page: page))
    }
    
    func getDetail(_ ofType: MovieEndpoint) async -> MovieDetailModel? {
        return (await repo.getDetail(ofType))
    }
    
    func getSavedMovies() -> [MovieDetailModel] {
        return repo.getSavedMovies()
    }
    
    func insertMovie(movie: MovieDetailModel) {
        repo.insertMovie(movie: movie)
    }
}
