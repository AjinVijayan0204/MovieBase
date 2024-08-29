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
        NavigationStack{
            GeometryReader { proxy in
                VStack{
                    ScrollView(.vertical, showsIndicators: false) {
                        TrendingMovies(vm: vm.trendingMovieVM)
                            .frame(height: proxy.size.height * 0.6)
                        
                        HorizontalScrollView(vm: vm.createViewModel(.popularMovies))
                            .frame(width: proxy.size.width, height: proxy.size.height * 0.4)
                        
                        HorizontalScrollView(vm: vm.createViewModel(.topRated))
                            .frame(width: proxy.size.width, height: proxy.size.height * 0.4)
                        
                        Spacer()
                            .frame(height: proxy.size.height * 0.1)
                    }
                }
                .background(.black)
                .ignoresSafeArea()
                .toolbar(content: {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Image("icon_header")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.leading, -50)
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            //TODO: - search
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.white)
                                .headerImageStyle()
                        }
                        
                        Button {
                            //TODO: - Profile
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .foregroundStyle(.white)
                                .headerImageStyle()
                        }
                        
                    }
                })
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $vm.toDetailScreen) {
                    MovieDetailView(vm: vm.movieDetailViewModel)
                }
                .toolbarBackground(.opacity(0.6), for: .navigationBar)
            }
        }
    }
}

#Preview {
    MovieListView(vm: MovieListViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSourcesImpl()))))
}
