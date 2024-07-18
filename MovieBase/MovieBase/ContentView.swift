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
    
    
    init() {
        UIScrollView.appearance().bounces = false
        self.dataSource = MovieAPIImpl()
        self.movieRepository = MovieReposImpl(dataSource: dataSource)
        self.movieUseCase = MovieUseCases(repo: movieRepository)
        self.movieListViewModel = MovieListViewModel(movieUseCase: movieUseCase)
       }
    
    var body: some View {
        NavigationStack {
            MovieListView(vm: movieListViewModel)
                .ignoresSafeArea()
        }.tint(.white)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
