//
//  MovieDetailView.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var vm: MovieDetailViewModel
    
    var body: some View {
        GeometryReader{ proxy in
            if let movie = vm.movie{
                ScrollView(.vertical) {
                    VStack(alignment: .center) {
                        if vm.isOnline{
                            CardView(id: movie.movieId,
                                     name: movie.originalTitle,
                                     url: movie.posterPath, action: {_ in })
                            .aspectRatio(1.1, contentMode: .fit)
                                .frame(height: proxy.size.height * 0.35)
                        }else{
                            OfflineImageView(movie: movie, action: {_ in })
                                .aspectRatio(1.1, contentMode: .fit)
                                .frame(height: proxy.size.height * 0.35)
                        }
                        MovieDataDetailView(movie: movie,
                                            isOnline: vm.isOnline,
                                            isLiked: $vm.isLiked,
                                            action: vm.addFavourite)
                        
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .top)
                    .padding(.top, proxy.size.height * 0.1)
                }
                
            }else{
                ProgressView()
                    .tint(Color.white)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            
        }
        .background(.black)
        .toolbar(.hidden, for: .tabBar)
        .onAppear{
            vm.getMovieDetails()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MovieDetailView(vm: MovieDetailViewModel(selectedMovieId: 0, movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSourcesImpl()))))
}
