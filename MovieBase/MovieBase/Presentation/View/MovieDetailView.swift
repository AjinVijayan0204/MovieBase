//
//  MovieDetailView.swift
//  MovieBase
//
//  Created by Ajin on 16/07/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    @StateObject var vm: MovieDetailViewModel
    
    var body: some View {
        VStack{
            if let movie = vm.movie{
                GeometryReader { proxy in
                    ScrollView(.vertical) {
                        VStack(alignment: .leading){
                            
                            NetworkImageView(mode: .card,
                                             id: movie.movieId,
                                             imgUrl: movie.posterPath,
                                             action: vm.dummy(num:))
                            .frame(height: proxy.size.height * 0.35)
                            
                            MovieDataDetailView(movie: movie)
                        }
                    }
                }
            }else{
                ProgressView()
                    .tint(Color.white)
            }
        }
        .padding(.horizontal)
        .background(Color.black)
        .onAppear{
            vm.getMovieDetails()
        }
    }
}

struct MovieDataDetailView: View {
    
    let movie: MovieDetailModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text(movie.originalTitle)
                .movieHeader()
                .padding()
            
            HStack{
                Group{
                    Text(movie.releaseYear)
                        .bold()
                    Text("\(movie.likedPercentage)% Like")
                        .padding(.horizontal, 8)
                        .background {
                            Color.gray
                        }
                    Text(movie.duration)
                }
                .padding(.trailing)
                .foregroundStyle(.white)
                
            }
            Text(movie.overview)
                
            .foregroundStyle(.white)
            .padding(.top)
        }
    }
}

#Preview {
    MovieDetailView(vm:MovieDetailViewModel(selectedMovieId: 0,
                                            movieUseCase: MovieUseCases(
                                                repo: MovieReposImpl(
                                                    dataSource: MovieAPIImpl())
                                            )
                                           )
    )
}
