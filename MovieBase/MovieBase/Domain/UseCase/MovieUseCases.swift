//
//  MovieUseCases.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

protocol  MovieUseCases{
    func getMovies(_ ofType: MovieEndpoint, page: Int) async -> [MovieCardModel]
    func getDetail(_ ofType: MovieEndpoint) async -> MovieDetailModel?
    func getSavedMovies()-> [MovieDetailModel]
    //insert to fav
    func insertMovie(movie: MovieDetailModel)
    func deleteMovie(movie: MovieDetailModel)
}

