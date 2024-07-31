//
//  MovieListViewModel.swift
//  MovieBase
//
//  Created by Ajin on 09/07/24.
//

import Foundation

class MovieListViewModel: ObservableObject{
    
    var movieUseCase: MovieUseCases
    var movieDetailViewModel: MovieDetailViewModel?
    let trendingMovieVM: TrendingMovieViewModel
    
    @Published var latest: MovieDetailModel?
    @Published var toDetailScreen: Bool = false
    
    init(movieUseCase: MovieUseCases){
        self.movieUseCase = movieUseCase
        self.trendingMovieVM = TrendingMovieViewModel(movieUseCase: movieUseCase, action: { _ in
            
        })
    }
    
    func createViewModel(_ ofType: MovieEndpoint)-> HorizontalScrollViewModel{
        return HorizontalScrollViewModel(type: ofType, movieUseCase: self.movieUseCase, action: self.getMovieDetails(id:))
    }
    
    func getMovieDetails(id: Int){
        self.movieDetailViewModel =  MovieDetailViewModel(selectedMovieId: id, movieUseCase: movieUseCase)
        self.toDetailScreen = true
    }
}
