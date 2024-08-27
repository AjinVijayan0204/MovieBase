//
//  MovieReposImpl.swift
//  MovieBase
//
//  Created by Ajin on 09/07/24.
//

import Foundation

struct MovieReposImpl: MovieRepository{
    
    var dataSource: MovieApi
    var localDataSource: SwiftDataSources
    
    func getMovies(_ ofType: MovieEndpoint, page: Int) async -> Result<[MovieCardModel], Error> {
        do{
            let movies = try await dataSource.getMovies(ofType, page: page)
            let presentationModel = convertMoviesDataToPresentationModel(movies)
            return .success(presentationModel)
        }catch {
            switch error{
            default:
                return .failure(error)
            }
        }
        
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
   
    func getDetail(_ ofType: MovieEndpoint) async -> Result<MovieDetailModel, Error> {
        do{
            let movieDetail = try await dataSource.getMovieDetails(ofType)
            if let presentedMovieDetail = convertMovieDetailsToPresentationModel(movieDetail){
                return .success(presentedMovieDetail)
            }else{
                return .failure(MovieBaseErrors.conversionError)
            }
        }catch{
            switch error{
            default:
                return .failure(error)
            }
        }
        
    }
    
    func convertMovieDetailsToPresentationModel(_ movie: MovieDetailResponseModel?)-> MovieDetailModel?{
        guard let movie = movie else{ return nil}
        let convertedMovie: MovieDetailModel = MovieDetailModel(
            movieId: movie.movieId,
            adult: movie.adult,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            releaseDate: movie.releaseDate,
            title: movie.title,
            runtime: movie.runtime, 
            posterPath: movie.posterPath,
            voteAvg: movie.voteAvg
        )
        return convertedMovie
    }
    
    func getSavedMovies()-> [MovieDetailModel]{
        let movies = localDataSource.getMovies()
        let presentationModels = convertStoredMovieToCardModel(movies)
        return presentationModels
    }
    
    func convertStoredMovieToCardModel(_ movies: [MovieDataModel])-> [MovieDetailModel]{
        var convertedMovies: [MovieDetailModel] = []
        movies.forEach { movie in
            convertedMovies.append(MovieDetailModel(
                movieId: movie.movieId,
                adult: movie.adult,
                originalLanguage: movie.originalLanguage,
                originalTitle: movie.originalTitle,
                overview: movie.overview,
                releaseDate: movie.releaseDate,
                title: movie.title,
                runtime: movie.runtime,
                posterPath: movie.posterPath,
                voteAvg: movie.voteAvg,
                poster: movie.poster
            )
                                   )
        }
        return convertedMovies
    }
    
    func insertMovie(movie: MovieDetailModel) {
        let model = convertMovieDetailToStoredModel(movie: movie)
        localDataSource.insert(model)
    }
    
    func deleteMovie(movie: MovieDetailModel) {
        let model = convertMovieDetailToStoredModel(movie: movie)
        localDataSource.deleteMovie(model)
    }
    
    func convertMovieDetailToStoredModel(movie: MovieDetailModel)-> MovieDataModel{
        let storedModel = MovieDataModel(movieId: movie.movieId,
                                         adult: movie.adult,
                                         originalLanguage: movie.originalLanguage,
                                         originalTitle: movie.originalTitle,
                                         overview: movie.overview,
                                         releaseDate: movie.releaseDate,
                                         title: movie.title,
                                         runtime: movie.runtime,
                                         posterPath: movie.posterPath,
                                         voteAvg: movie.voteAvg)
        return storedModel
    }
}
