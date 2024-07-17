//
//  MovieListViewModel.swift
//  MovieBase
//
//  Created by Ajin on 09/07/24.
//

import Foundation

class MovieListViewModel: ObservableObject{
    
    var movieUseCase: MovieUseCases
    let movieDetailViewModel: MovieDetailViewModel
    
    @Published var popularMovies: [MovieCardModel] = .init()
    @Published var nowPlaying: [MovieCardModel] = .init()
    @Published var topRated: [MovieCardModel] = .init()
    @Published var latest: MovieDetailModel?
    @Published var toDetailScreen: Bool = false
    
    init(movieUseCase: MovieUseCases){
        self.movieUseCase = movieUseCase
        self.movieDetailViewModel = MovieDetailViewModel(selectedMovieId: 0, movieUseCase: movieUseCase)
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
    
    func getLatestMovie(_ ofType: MovieEndpoint){
        Task{
            let movie = try await movieUseCase.getDetail(ofType)
            print(movie)
            await MainActor.run {
                switch ofType{
                case .latest:
                    self.latest = movie
                default:
                    break
                }
            }
        }
    }
    
    func getLatestMovie(){
        getLatestMovie(.latest)
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
    
    func getMovieDetails(id: Int){
        self.movieDetailViewModel.selectedMovieId = id
        self.toDetailScreen = true
    }
}
