//
//  FavouritesViewVM.swift
//  MovieBase
//
//  Created by Ajin on 31/07/24.
//

import Foundation

class FavouritesViewModel: ObservableObject{
    
    @Published var movies: [MovieDetailModel] = []
    @Published var toDetailView: Bool = false
    
    var movieUseCase: MovieUseCases
    var movieDetailViewModel: MovieDetailViewModel
    
    init(movieUseCase: MovieUseCases) {
        self.movieUseCase = movieUseCase
        movieDetailViewModel = MovieDetailViewModel(selectedMovieId: 0, movieUseCase: movieUseCase, movie: nil)
    }
    
    func getSavedMovies(){
        self.movies = movieUseCase.getSavedMovies()
    }
    
    func moveToDetailView(_ movie: MovieDetailModel){
        toDetailView = true
        movieDetailViewModel = MovieDetailViewModel(selectedMovieId: nil, movieUseCase: movieUseCase, isOnline: false, movie: movie)
    }
}
