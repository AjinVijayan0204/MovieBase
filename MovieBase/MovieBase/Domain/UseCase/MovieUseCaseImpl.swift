//
//  MovieUseCaseImpl.swift
//  MovieBase
//
//  Created by Ajin on 28/07/24.
//

import Foundation

struct MovieUseCasesImpl: MovieUseCases{
    
    var repo: MovieRepository
    
    func getMovies(_ ofType: MovieEndpoint, page: Int) async -> Result<[MovieCardModel], Error> {
        return (await repo.getMovies(ofType, page: page))
    }
    
    func getDetail(_ ofType: MovieEndpoint) async -> Result<MovieDetailModel, Error> {
        return (await repo.getDetail(ofType))
    }
    
    func getSavedMovies() -> [MovieDetailModel] {
        return repo.getSavedMovies()
    }
    
    func insertMovie(movie: MovieDetailModel) {
        repo.insertMovie(movie: movie)
    }
    
    func deleteMovie(movie: MovieDetailModel) {
        repo.deleteMovie(movie: movie)
    }
}
