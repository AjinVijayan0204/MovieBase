//
//  MovieReposImpl.swift
//  MovieBase
//
//  Created by Ajin on 09/07/24.
//

import Foundation

struct MovieReposImpl: MovieRepository{
    
    var dataSource: MovieAPIImpl
    
    func getMovies() async -> [MovieCardModel] {
        
        let movies = await dataSource.getMovies()
        let presentationModel = convertDataToPresentationModel(movies)
        return presentationModel
    }
   
    func convertDataToPresentationModel(_ movies: [Movie])-> [MovieCardModel]{
        var convertedMovies: [MovieCardModel] = []
        movies.forEach { movie in
            convertedMovies.append(MovieCardModel(movieId: movie.movieId,
                                                  originalTitle: movie.originalTitle,
                                                  posterPath: movie.posterPath)
            )
        }
        return convertedMovies
    }
}
