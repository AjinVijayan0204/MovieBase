//
//  MovieRepository.swift
//  MovieBase
//
//  Created by Ajin on 08/07/24.
//

import Foundation

protocol MovieRepository{
    func getMovies() async throws-> [MovieCardModel]
}
