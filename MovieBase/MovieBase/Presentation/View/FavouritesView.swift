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
            var adaptiveColumn = Array(repeating: GridItem(), count: 2)
            ScrollView{
                LazyVGrid(columns: adaptiveColumn, spacing: 20){
                    ForEach(vm.movies, id: \.self){ movie in
                        CardView(id: movie.movieId,
                                 name: movie.originalTitle,
                                 url: movie.posterPath) { _ in
                            //
                        }
                                 .frame(height: Screen.shared.height * 0.3)
                    }
                }
                .onAppear{
                    vm.getSavedMovies()
                }
            }
        }
    }
}

#Preview {
    FavouritesView(vm: FavouritesViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources()))))
}
