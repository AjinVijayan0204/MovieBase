//
//  MovieUseCases.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

struct MovieUseCases: MovieRepository{
    
    var repo: MovieRepository
    
    func getMovies(_ ofType: MovieEndpoint, page: Int) async -> [MovieCardModel] {
        return (await repo.getMovies(ofType, page: page))
    }
    
    func getDetail(_ ofType: MovieEndpoint) async -> MovieDetailModel? {
        return (await repo.getDetail(ofType))
    }
}
