//
//  FavouritesViewVM.swift
//  MovieBase
//
//  Created by Ajin on 31/07/24.
//

import Foundation

class FavouritesViewModel: ObservableObject{
    
    @Published var movies: [MovieDetailModel] = []
    var movieUseCase: MovieUseCases
    
    init(movieUseCase: MovieUseCases) {
        self.movieUseCase = movieUseCase
    }
    
    func getSavedMovies(){
        self.movies = movieUseCase.getSavedMovies()
    }
}
