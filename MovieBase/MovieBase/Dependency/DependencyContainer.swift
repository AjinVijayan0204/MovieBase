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
    let swiftModelDataSource: SwiftDataSources
    
    init() {
        self.dataSource = MovieAPIImpl()
        self.swiftModelDataSource = SwiftDataSources()
        self.movieRepository = MovieReposImpl(dataSource: dataSource, localDataSource: swiftModelDataSource)
        self.movieUseCase = MovieUseCasesImpl(repo: movieRepository)
        self.movieListViewModel = MovieListViewModel(movieUseCase: movieUseCase)
    }
}
