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
    var page: Int = 1
    
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
        self.loadMovies()
    }
    
    func getMoviesForList(_ ofType: MovieEndpoint) async-> [MovieCardModel]{
            let movies = await movieUseCase.getMovies(ofType, page: self.page)
            return movies
    }
    
    func loadMovies(){
        Task{
            let movies = await getMoviesForList(self.type)
            await MainActor.run {
                self.moviesList = (movies.isEmpty) ? Array(repeating: MovieCardModel(movieId: 0, originalTitle: "", posterPath: ""), count: 5) : movies
            }
        }
        
    }
    
    func loadNextPage(){
        self.page += 1
        Task{
            let movies = await getMoviesForList(self.type)
            await MainActor.run {
                self.moviesList.append(contentsOf: movies)
            }
        }
    }
}
