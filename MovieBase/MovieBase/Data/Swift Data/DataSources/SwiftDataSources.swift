//
//  SwiftDataSources.swift
//  MovieBase
//
//  Created by Ajin on 30/07/24.
//

import Foundation
import SwiftData
import SwiftUI

class SwiftDataSources{
    var context: ModelContext?
    var container: ModelContainer?
    var movies: [MovieDataModel] = []
    
    init() {
        self.container = try? ModelContainer(for: MovieDataModel.self)
        if let container = container{
            self.context = ModelContext(container)
        }
    }
    
    func insert(_ movie: MovieDataModel){
        guard let context = self.context else { return }
        context.insert(movie)
        do{
            try context.save()
        }catch{
            print("failed")
        }
    }
    
    func getMovies()-> [MovieDataModel]{
        guard let context = self.context else { return [MovieDataModel]() }
        let descriptor = FetchDescriptor<MovieDataModel>()
        do{
            movies = try context.fetch(descriptor)
        }catch{
            print("Error")
        }
        return movies
    }
    
    func deleteMovie(_ movie: MovieDataModel){
        guard let context = self.context else { return }
        let movies = getMovies().filter { storedMovie in
            movie.movieId == storedMovie.movieId
        }
        guard let movieToDelete = movies.first else { return }
        context.delete(movieToDelete)
        do{
            try context.save()
        }catch{
            print("failed")
        }
    }
}
