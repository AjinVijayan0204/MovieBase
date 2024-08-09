//
//  OfflineImageView.swift
//  MovieBase
//
//  Created by Ajin on 02/08/24.
//

import SwiftUI

struct OfflineImageView: View {
    let movie: MovieDetailModel
    var action: (MovieDetailModel)-> ()
    
    var body: some View {
        Image(uiImage: UIImage(data: movie.poster ?? Data()) ?? UIImage())
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                self.action(movie)
            }
    }
}

#Preview {
    OfflineImageView(movie: MovieDetailModel(movieId: 0, adult: false, originalLanguage: "", originalTitle: "", overview: "", releaseDate: "", title: "", runtime: 0, posterPath: "", voteAvg: 0), action: { _ in
        
    })
}
