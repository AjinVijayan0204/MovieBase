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
                VStack {
                    if vm.isOnline{
                        Color.yellow
                            .aspectRatio(16/9, contentMode: .fit)
                            .frame(height: proxy.size.height * 0.35)
                    }else{
                        Color.white
                            .aspectRatio(16/9, contentMode: .fit)
                            .frame(height: proxy.size.height * 0.35)
                    }
                    MovieDataDetailView(movie: movie,
                                        isOnline: vm.isOnline,
                                        isLiked: $vm.isLiked,
                                        action: vm.addFavourite)
                    
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }else{
                ProgressView()
                    .tint(Color.white)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            
        }
        .background(.black)
        .onAppear{
            vm.getMovieDetails()
        }
    }
}

#Preview {
    MovieDetailView(vm: MovieDetailViewModel(selectedMovieId: 0, movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources()))))
}
