//
//  FavouritesView.swift
//  MovieBase
//
//  Created by Ajin on 30/07/24.
//

import SwiftUI
import SwiftData

struct FavouritesView: View {
    
    @ObservedObject var vm: FavouritesViewModel
    
    var body: some View {
        GeometryReader {proxy in
            let adaptiveColumn = Array(repeating: GridItem(), count: 3)
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: proxy.size.height * 0.1)
                Text("Favourites")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title3)
                ScrollView(.vertical){
                    LazyVGrid(columns: adaptiveColumn, spacing: 20){
                        ForEach(vm.movies, id: \.self){ movie in
                            if let poster = movie.poster{
                                OfflineImageView(movie: movie, action: vm.moveToDetailView(_:))
                                    .frame(width: proxy.size.width * 0.3, height: proxy.size.height * 0.3)
                            }
                           
                        }
                    }
                    .padding(.bottom, proxy.size.height * 0.15)
                    .onAppear{
                        vm.getSavedMovies()
                    }
                }
            }
            .background {
                Color.black
            }
            .ignoresSafeArea()
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        .navigationDestination(isPresented: $vm.toDetailView) {
            MovieDetailView(vm: vm.movieDetailViewModel)
        }
    }
}

#Preview {
    FavouritesView(vm: FavouritesViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources()))))
}
