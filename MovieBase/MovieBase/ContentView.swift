//
//  ContentView.swift
//  MovieBase
//
//  Created by Ajin on 07/07/24.
//

import SwiftUI

struct ContentView: View {
    
    let dataSource: MovieAPIImpl
    let movieRepository: MovieRepository
    let movieUseCase: MovieUseCases
    let movieListViewModel: MovieListViewModel
    let movieDetailViewModel: MovieDetailViewModel
    
    init() {
          UIScrollView.appearance().bounces = false
        self.dataSource = MovieAPIImpl()
        self.movieRepository = MovieReposImpl(dataSource: dataSource)
        self.movieUseCase = MovieUseCases(repo: movieRepository)
        self.movieListViewModel = MovieListViewModel(movieUseCase: movieUseCase)
        self.movieDetailViewModel = MovieDetailViewModel(movieUseCase: movieUseCase)
       }
    
    var body: some View {
//        MovieListView(vm: movieListViewModel)
//            .background(content: {
//                Color.black
//            })
        MovieDetailView(movieDetailViewModel: movieDetailViewModel)
            .ignoresSafeArea()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
