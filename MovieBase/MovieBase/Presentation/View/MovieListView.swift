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
        GeometryReader { proxy in
            ScrollView(.vertical) {
                VStack(alignment: .leading){
                    
                    TrendingMovies(vm: vm.trendingMovieVM)
                        .padding(.top, 35)
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.35)
                    
                    HorizontalScrollView(vm: vm.createViewModel(.popularMovies))
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.3)
                    HorizontalScrollView(vm: vm.createViewModel(.topRated))
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.3)
                    
                }
                .padding(.bottom, 120)
                .padding(.top)
                .padding(.horizontal)
                .frame(width: proxy.size.width, alignment: .top)
                .navigationDestination(isPresented: $vm.toDetailScreen) {
                    MovieDetailView(vm: vm.movieDetailViewModel)
                }
            }
            .background(content: {
                Color.black
        })
        }
        .ignoresSafeArea()
    }
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(vm: MovieListViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl()))))
    }
}
