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
                ScrollView(.vertical) {
                    VStack(alignment: .leading){
                        
                        NetworkImageView(imgUrl: movie.posterPath)
                        
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
                    .frame(width: Screen.shared.width * 0.9)
                }
            }else{
                ProgressView()
                    .tint(Color.white)
            }
        }
        .frame(width: Screen.shared.width, height: Screen.shared.height)
        .padding(.top, Screen.shared.height * 0.15)
        .padding(.horizontal)
        .background(Color.black)
        .onAppear{
            vm.getMovieDetails()
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
