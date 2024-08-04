//
//  MovieListView.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var vm: MovieListViewModel
    
    var body: some View {
        GeometryReader{ proxy in
            ZStack(alignment: .top){
                ScrollView(.vertical) {
                    TrendingMovies(vm: vm.trendingMovieVM)
                        .frame(height: proxy.size.height * 0.6)
                    
                    HorizontalScrollView(vm: vm.createViewModel(.popularMovies))
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.3)
                    
                    HorizontalScrollView(vm: vm.createViewModel(.topRated))
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.3)
                }
                .padding(.bottom, proxy.size.height * 0.1)
                
                ZStack {
                    Color.black
                        .frame(width: proxy.size.width * 1, height: proxy.size.height * 0.1)
                        .opacity(0.4)
                    
                    HeaderView()
                        .frame(width: proxy.size.width * 0.98, height: proxy.size.height * 0.1)
                    
                }
            }
            .background(.black)
        }
        .ignoresSafeArea()
        .navigationDestination(isPresented: $vm.toDetailScreen) {
            MovieDetailView(vm: vm.movieDetailViewModel)
        }
    }
}

#Preview {
    MovieListView(vm: MovieListViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources()))))
}
