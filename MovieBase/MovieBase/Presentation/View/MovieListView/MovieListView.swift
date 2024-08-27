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
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    ZStack(alignment: .top){
                        ScrollView(.vertical, showsIndicators: false) {
                            TrendingMovies(vm: vm.trendingMovieVM)
                                .frame(height: proxy.size.height * 0.6)
                            
                            HorizontalScrollView(vm: vm.createViewModel(.popularMovies))
                                .frame(width: proxy.size.width, height: proxy.size.height * 0.3)
                            
                            HorizontalScrollView(vm: vm.createViewModel(.topRated))
                                .frame(width: proxy.size.width, height: proxy.size.height * 0.3)
                            Spacer()
                                .frame(width: proxy.size.width, height: proxy.size.height * 0.12)
                        }
                    }
                    .background(.black)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $vm.toDetailScreen) {
                    MovieDetailView(vm: vm.movieDetailViewModel)
                }
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
                .toolbarBackground(.opacity(0.1), for: .navigationBar)
            }
            .onAppear{
                UINavigationBar.appearance().barTintColor = .clear
            }
        .ignoresSafeArea()
        }
        
    }
}

#Preview {
    MovieListView(vm: MovieListViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSourcesImpl()))))
}
