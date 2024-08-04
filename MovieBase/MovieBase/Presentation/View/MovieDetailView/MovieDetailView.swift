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
                
                MovieDataDetailView(movie: movie,
                                    isOnline: vm.isOnline,
                                    isLiked: $vm.isLiked,
                                    action: vm.addFavourite)
                .frame(width: proxy.size.width, height: proxy.size.height * 0.04)
            }
            
        }
        .onAppear{
            vm.getMovieDetails()
        }
    }
}

#Preview {
    MovieDetailView(vm: MovieDetailViewModel(selectedMovieId: 0, movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources()))))
}
