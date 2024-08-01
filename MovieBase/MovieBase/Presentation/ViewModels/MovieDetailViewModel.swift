//
//  MovieDetailViewModel.swift
//  MovieBase
//
//  Created by Ajin on 16/07/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject{
    
    var selectedMovieId: Int?
    var movieUseCase: MovieUseCases
    
    @Published var isLiked: Bool = false
    @Published var movie: MovieDetailModel?
    
    init(selectedMovieId: Int?, movieUseCase: MovieUseCases){
        self.selectedMovieId = selectedMovieId
        self.movieUseCase = movieUseCase
        self.isLiked = findIsFavourite()
    }
    
    func getMovieDetails(){
        self.getMovieDetails(.movieDetail(id: selectedMovieId ?? 0))
    }
    
    func getMovieDetails(_ ofType: MovieEndpoint){
        Task{
            let movie = await movieUseCase.getDetail(ofType)
            await MainActor.run {
                switch ofType{
                case .movieDetail(id: _):
                    if let movie = movie{
                        self.movie = movie
                    }
                default:
                    break
                }
            }
        }
    }
    
    func dummy(num: Int){
        
    }
    
    func addFavourite(){
        if let movie = self.movie{
            if self.isLiked{
                movieUseCase.insertMovie(movie: movie)
            }else{
                movieUseCase.deleteMovie(movie: movie)
            }
        }
    }
    
    func findIsFavourite()-> Bool{
        return movieUseCase.getSavedMovies().contains { movie in
            movie.movieId == self.selectedMovieId
        }
    }
}
