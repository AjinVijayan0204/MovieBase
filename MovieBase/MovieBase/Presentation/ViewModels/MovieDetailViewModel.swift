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
    var isOnline: Bool
    
    @Published var isLiked: Bool = false
    @Published var movie: MovieDetailModel?
    
    init(selectedMovieId: Int?, movieUseCase: MovieUseCases, isOnline: Bool = true, movie: MovieDetailModel? = nil){
        self.selectedMovieId = selectedMovieId
        self.movieUseCase = movieUseCase
        self.movie = movie
        self.isOnline = isOnline
        self.isLiked = findIsFavourite()
    }
    
    func getMovieDetails(){
        if isOnline{
            self.getMovieDetails(.movieDetail(id: selectedMovieId ?? 0))
        }
    }
    
    func getMovieDetails(_ ofType: MovieEndpoint){
        Task{
            let result = await movieUseCase.getDetail(ofType)
            await MainActor.run {
                switch ofType{
                case .movieDetail(id: _):
                    switch result {
                    case .success(let movie):
                        self.movie = movie
                    case .failure(let error):
                        print("error \(error.localizedDescription)")
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
