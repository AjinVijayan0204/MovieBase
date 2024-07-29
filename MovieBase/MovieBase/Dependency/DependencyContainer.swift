//
//  DependencyContainer.swift
//  MovieBase
//
//  Created by Ajin on 29/07/24.
//

import Foundation

class DependencyContainer{
    
    let dataSource: MovieAPIImpl
    let movieRepository: MovieRepository
    let movieUseCase: MovieUseCases
    let movieListViewModel: MovieListViewModel
    
    init() {
        self.dataSource = MovieAPIImpl()
        self.movieRepository = MovieReposImpl(dataSource: dataSource)
        self.movieUseCase = MovieUseCases(repo: movieRepository)
        self.movieListViewModel = MovieListViewModel(movieUseCase: movieUseCase)
    }
}
