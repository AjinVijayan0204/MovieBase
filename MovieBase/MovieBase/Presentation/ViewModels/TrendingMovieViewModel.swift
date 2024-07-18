//
//  TrendingMovieViewModel.swift
//  MovieBase
//
//  Created by Ajin on 18/07/24.
//

import Foundation

class TrendingMovieViewModel: ObservableObject{
    
    @Published var selectedIndex: Int = 0
    @Published var upcoming: [MovieCardModel] = Array(repeating: MovieCardModel(movieId: 0, originalTitle: "", posterPath: ""), count: 6)
    
    var movieUseCase: MovieUseCases
    var timer: Timer?
    
    init(movieUseCase: MovieUseCases) {
        self.movieUseCase = movieUseCase
        self.autoScroll()
    }
    
    func getMovies(_ ofType: MovieEndpoint){
        Task{
            let movies = try await movieUseCase.getMovies(ofType)
            await MainActor.run(body: {
                switch ofType{
                case .nowPlaying:
                    self.upcoming = Array(movies.prefix(upTo: 5))
                default:
                    break
                }
            })
        }
    }
    
    func autoScroll(){
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { _ in
            self.selectedIndex = (self.selectedIndex == 5) ? 0 : (self.selectedIndex + 1)
        })
    }
    
    func getUpcomingMovies(){
        self.getMovies(.nowPlaying)
    }
}
