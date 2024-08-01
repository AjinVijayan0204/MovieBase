//
//  FavouritesView.swift
//  MovieBase
//
//  Created by Ajin on 30/07/24.
//

import SwiftUI
import SwiftData

struct FavouritesView: View {
    @State var movies: [MovieDataModel] = []
    let dataSrc = SwiftDataSources()
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 20){
                ForEach(movies, id: \.self){ movie in
                    CardView(id: movie.movieId,
                             name: movie.originalTitle,
                             url: movie.posterPath) { _ in
                        //
                    }
                             .frame(height: Screen.shared.height * 0.3)
                }
            }
            .onAppear{
                self.movies = dataSrc.getMovies()
            }
        }
    }
}

#Preview {
    FavouritesView()
}
