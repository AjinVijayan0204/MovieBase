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
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter", text: $text)
            Button {
                let movie = MovieDataModel(movieId: 0,
                                           adult: false,
                                           originalLanguage: "En",
                                           originalTitle: text,
                                           overview: "",
                                           releaseDate: "",
                                           title: text,
                                           runtime: 0,
                                           posterPath: "",
                                           voteAvg: 0)
                dataSrc.insert(movie)
                self.movies = dataSrc.getMovies()
            } label: {
                Text("Add")
                    .foregroundStyle(.black)
            }

            List{
                ForEach(movies, id: \.self){ movie in
                    Text(movie.originalTitle)
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
