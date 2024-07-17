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
                        
                        Group {
                            Text(movie.originalTitle)
                                .sectionHeader()
                            Text(movie.overview)
                            Text(movie.releaseDate)
                            Text(movie.runtime.description)
                        }
                        .foregroundStyle(.white)
                    }
                }
            }else{
                ProgressView()
                    .tint(Color.white)
            }
        }
        .frame(width: Screen.shared.width, height: Screen.shared.height)
        .padding(.top, Screen.shared.height * 0.15)
        .padding(.horizontal)
        .background(content: {
            Color.black
        })
        .ignoresSafeArea()
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
