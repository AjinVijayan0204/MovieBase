//
//  HorizontalScrollViewModel.swift
//  MovieBase
//
//  Created by Ajin on 20/07/24.
//

import Foundation

class HorizontalScrollViewModel: ObservableObject{
    
    var name: String
    let type: MovieEndpoint
    var movieUseCase: MovieUseCases
    
    @Published var moviesList: [MovieCardModel] = Array(repeating: MovieCardModel(movieId: 0, originalTitle: "", posterPath: ""), count: 5)
    
    var action: (Int)-> ()
    
    init(type: MovieEndpoint, movieUseCase: MovieUseCases, action: @escaping (Int)-> ()){
        self.type = type
        self.movieUseCase = movieUseCase
        self.action = action
        
        self.name = switch type{
        case .popularMovies:
            "Popular Movies"
        case .topRated:
            "Top Rated"
        default:
            ""
        }
    }
    
    func getMovies(_ ofType: MovieEndpoint){
        Task{
            let movies = try await movieUseCase.getMovies(ofType)
            await MainActor.run(body: {
                self.moviesList = (movies.isEmpty) ? Array(repeating: MovieCardModel(movieId: 0, originalTitle: "", posterPath: ""), count: 5) : movies
            })
        }
    }
    
}
