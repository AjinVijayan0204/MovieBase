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
        VStack{
            Spacer()
                .setHeightRelativeToParent(0.15)
            if let movie = vm.movie{
                ScrollView(.vertical) {
                    VStack(alignment: .center) {
                        if vm.isOnline{
                            CardView(id: movie.movieId,
                                     name: movie.originalTitle,
                                     url: movie.posterPath, action: {_ in })
                            .aspectRatio(1.1, contentMode: .fit)
                            .setHeightRelativeToParent(0.35)
                        }else{
                            OfflineImageView(movie: movie, action: {_ in })
                                .aspectRatio(1.1, contentMode: .fit)
                                .setHeightRelativeToParent(0.35)
                        }
                        MovieDataDetailView(movie: movie,
                                            isOnline: vm.isOnline,
                                            isLiked: $vm.isLiked,
                                            action: vm.addFavourite)
                        
                    }
                }
                
            }else{
                ProgressView()
                    .setWidthRelativeToParent(1)
                    .setHeightRelativeToParent(1)
                    .tint(Color.white)
            }
            
        }
        .setWidthRelativeToParent(1)
        .ignoresSafeArea()
        .background(.black)
        .toolbar(.hidden, for: .tabBar)
        .onAppear{
            vm.getMovieDetails()
        }
    }
}

#Preview {
    MovieDetailView(vm: MovieDetailViewModel(selectedMovieId: 0, movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSourcesImpl()))))
}
