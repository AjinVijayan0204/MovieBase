//
//  MovieRepository.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

protocol MovieRepository{
    func getMovies(_ ofType: MovieEndpoint, page: Int) async -> Result<[MovieCardModel], Error>
    func getDetail(_ ofType: MovieEndpoint) async -> Result<MovieDetailModel, Error>
    func getSavedMovies()-> [MovieDetailModel]
    //insert to fav
    func insertMovie(movie: MovieDetailModel)
    func deleteMovie(movie: MovieDetailModel)
}
