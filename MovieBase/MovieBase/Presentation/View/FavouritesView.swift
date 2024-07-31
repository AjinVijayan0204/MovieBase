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
