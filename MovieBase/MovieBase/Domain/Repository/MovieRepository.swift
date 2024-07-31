//
//  MovieRepository.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

protocol MovieRepository{
    func getMovies(_ ofType: MovieEndpoint, page: Int) async -> [MovieCardModel]
    func getDetail(_ ofType: MovieEndpoint) async -> MovieDetailModel?
    func getSavedMovies()-> [MovieDetailModel]
    //insert to fav
    func insertMovie(movie: MovieDetailModel)
}
