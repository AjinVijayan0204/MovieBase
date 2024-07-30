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
    let context: ModelContext
    
    let container: ModelContainer
    
    var movies: [MovieDataModel] = []
    
    init() {
        
        self.container = try! ModelContainer(for: MovieDataModel.self)
        self.context = ModelContext(self.container)
    }
    
    func insert(_ movie: MovieDataModel){
        context.insert(movie)
        print("insert")
        try! context.save()
        
        print(movies)
    }
    
    func getMovies()-> [MovieDataModel]{
        let descriptor = FetchDescriptor<MovieDataModel>()
        do{
            movies = try context.fetch(descriptor)
        }catch{
            print("Error")
        }
        return movies
    }
    
}
