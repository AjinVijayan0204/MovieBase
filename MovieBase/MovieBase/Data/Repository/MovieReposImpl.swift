//
//  MovieReposImpl.swift
//  MovieBase
//
//  Created by Ajin on 09/07/24.
//

import Foundation

struct MovieReposImpl: MovieRepository{
    
    var dataSource: MovieAPIImpl
    
    func getMovies(_ ofType: MovieEndpoint) async -> [MovieCardModel] {
        let movies = await dataSource.getMovies(ofType)
        let presentationModel = convertMoviesDataToPresentationModel(movies)
        return presentationModel
    }
    
    func convertMoviesDataToPresentationModel(_ movies: [Movie])-> [MovieCardModel]{
        var convertedMovies: [MovieCardModel] = []
        movies.forEach { movie in
            convertedMovies.append(MovieCardModel(movieId: movie.movieId,
                                                  originalTitle: movie.originalTitle,
                                                  posterPath: movie.posterPath)
            )
        }
        return convertedMovies
    }
   
    func getDetail(_ ofType: MovieEndpoint) async throws -> MovieDetailModel? {
        let movieDetail = await dataSource.getMovieDetails(ofType)
        let presentedMovieDetail = convertMovieDetailsToPresentationModel(movieDetail) ?? nil
        return presentedMovieDetail
    }
    
    func convertMovieDetailsToPresentationModel(_ movie: MovieDetailResponseModel?)-> MovieDetailModel?{
        guard let movie = movie else{ return nil}
        var convertedMovie: MovieDetailModel = MovieDetailModel(
            adult: movie.adult,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            releaseDate: movie.releaseDate,
            title: movie.title,
            runtime: movie.runtime, 
            posterPath: movie.posterPath
        )
        return convertedMovie
    }
    
}
