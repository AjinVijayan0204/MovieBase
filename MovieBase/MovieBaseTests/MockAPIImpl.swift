//
//  MockAPIImpl.swift
//  MovieBaseTests
//
//  Created by Ajin on 26/08/24.
//

import Foundation
@testable import MovieBase

struct MockAPIImpl: MovieApi{
    
    var dummyMovies: [Movie] = [
    Movie(movieId: 0, originalTitle: "The mummy", posterPath: "sadfsdjfsafdsjfdsjafds"),
    Movie(movieId: 1, originalTitle: "The mummy 1", posterPath: "sadfssdjfsafdsjfdsjafds"),
    Movie(movieId: 2, originalTitle: "The mummy 2", posterPath: "sadfsdjfsafdsadsfjfdsjafds"),
    Movie(movieId: 3, originalTitle: "The mummy 3", posterPath: "sadfssdjfsdfafdsjfdsjafds"),
    Movie(movieId: 5, originalTitle: "The mummy 4", posterPath: "sadfsdjfsafdsjfdsfadjafds"),
    Movie(movieId: 1, originalTitle: "The mummy 5", posterPath: "sadfssdjfsafdsjfdsjadfafds")
    ]
    
    
    func getMovies(_ endPoint: MovieEndpoint, page: Int) async-> [Movie]{
        return self.dummyMovies
    }
    
    func getMovieDetails(_ endPoint: MovieEndpoint) async-> MovieDetailResponseModel?{
        let movieDetail = MovieDetailResponseModel(movieId: 0,
                                                   adult: false,
                                                   originalLanguage: "en",
                                                   originalTitle: "The Revanent",
                                                   overview: "fasdl;kasdjfaksdfkajkf fsdaklfkjasklfja asedjflajdlfalsdj afdslafkja",
                                                   releaseDate: "02-01-2006",
                                                   title: "The Revanent",
                                                   runtime: 180,
                                                   posterPath: "sdfadfafdsa",
                                                   voteAvg: 90)
        return movieDetail
    }
}


struct MockDataSourcesImpl: SwiftDataSources{
    
    let movies: [MovieDataModel] = [
        MovieDataModel(movieId: 0,
                       adult: false,
                       originalLanguage: "en",
                       originalTitle: "The Revanent",
                       overview: "fasdl;kasdjfaksdfkajkf fsdaklfkjasklfja asedjflajdlfalsdj afdslafkja",
                       releaseDate: "02-01-2006",
                       title: "The Revanent",
                       runtime: 180,
                       posterPath: "sdfadfafdsa",
                       voteAvg: 90),
        MovieDataModel(movieId: 0,
                       adult: false,
                       originalLanguage: "en",
                       originalTitle: "The Revanent",
                       overview: "fasdl;kasdjfaksdfkajkf fsdaklfkjasklfja asedjflajdlfalsdj afdslafkja",
                       releaseDate: "02-01-2006",
                       title: "The Revanent",
                       runtime: 180,
                       posterPath: "sdfadfafdsa",
                       voteAvg: 90),
        MovieDataModel(movieId: 0,
                       adult: false,
                       originalLanguage: "en",
                       originalTitle: "The Revanent",
                       overview: "fasdl;kasdjfaksdfkajkf fsdaklfkjasklfja asedjflajdlfalsdj afdslafkja",
                       releaseDate: "02-01-2006",
                       title: "The Revanent",
                       runtime: 180,
                       posterPath: "sdfadfafdsa",
                       voteAvg: 90)
        
        ]
    
    func getMovies()-> [MovieDataModel]{
        return self.movies
    }
    
    func deleteMovie(_ movie: MovieDataModel){
        
    }
    
    func insert(_ movie: MovieDataModel){
        
    }
}
