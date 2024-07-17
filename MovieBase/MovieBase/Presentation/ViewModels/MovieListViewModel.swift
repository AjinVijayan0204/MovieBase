//
//  MovieListViewModel.swift
//  MovieBase
//
//  Created by Ajin on 09/07/24.
//

import Foundation

class MovieListViewModel: ObservableObject{
    
    var movieUseCase: MovieUseCases
    
    @Published var popularMovies: [MovieCardModel] = .init()
    @Published var nowPlaying: [MovieCardModel] = .init()
    @Published var topRated: [MovieCardModel] = .init()
    
    init(movieUseCase: MovieUseCases){
        self.movieUseCase = movieUseCase
    }
    
    func getMovies(_ ofType: MovieEndpoint){
        Task{
            let movies = try await movieUseCase.getMovies(ofType)
            await MainActor.run(body: {
                switch ofType{
                case .nowPlaying:
                    self.nowPlaying = movies
                case .popularMovies:
                    self.popularMovies = movies
                case .topRated:
                    self.topRated = movies
                default:
                    break
                }
            })
        }
    }
    
    func getPopularMovies(){
        self.getMovies(.popularMovies)
    }
    
    func getNowPlayingMovie(){
        self.getMovies(.nowPlaying)
    }
    
    func getTopRatedMovie(){
        self.getMovies(.topRated)
    }
}
