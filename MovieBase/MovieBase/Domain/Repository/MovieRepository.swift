//
//  MovieRepository.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

protocol MovieRepository{
    func getMovies(_ ofType: MovieEndpoint) async throws-> [MovieCardModel]
    func getDetail(_ ofType: MovieEndpoint) async throws-> MovieDetailModel?
}
