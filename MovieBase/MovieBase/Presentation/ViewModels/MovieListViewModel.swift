//
//  MovieListViewModel.swift
//  MovieBase
//
//  Created by Ajin on 09/07/24.
//

import Foundation

class MovieListViewModel: ObservableObject{
    
    var movieUseCase = MovieUseCases(repo: MovieReposImpl(dataSource: MovieAPIImpl()))
    
    @Published var movies: [Movie] = .init()
    
    func getMovies(){
        Task{
            let movies = try await movieUseCase.getMovies()
            await MainActor.run(body: {
                self.movies = movies
            })
                
        }
        
    }
    
}
