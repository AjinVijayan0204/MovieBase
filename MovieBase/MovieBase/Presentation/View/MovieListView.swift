//
//  MovieListView.swift
//  MovieBase
//
//  Created by Ajin on 14/07/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var vm: MovieListViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading){
                
                TrendingMovies(vm: vm.trendingMovieVM)
                    .padding(.top)
                
                HorizontalScrollView(vm: vm.createViewModel(.popularMovies))
                HorizontalScrollView(vm: vm.createViewModel(.topRated))
            }
            .padding(.bottom, 20)
            .padding(.top)
            .padding(.horizontal)
            .frame(width: Screen.shared.width, alignment: .top)
            .navigationDestination(isPresented: $vm.toDetailScreen) {
                MovieDetailView(vm: vm.movieDetailViewModel)
            }
        }
        .background(content: {
            Color.black
        })
    }
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(vm: MovieListViewModel(movieUseCase: MovieUseCases(repo: MovieReposImpl(dataSource: MovieAPIImpl()))))
    }
}
