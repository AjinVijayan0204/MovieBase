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
    
    @Published var movie: MovieDetailModel?
    
    init(selectedMovieId: Int?, movieUseCase: MovieUseCases){
        self.selectedMovieId = selectedMovieId
        self.movieUseCase = movieUseCase
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
    
}
