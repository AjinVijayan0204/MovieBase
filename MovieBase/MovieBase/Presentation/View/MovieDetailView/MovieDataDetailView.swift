//
//  MovieDataDetailView.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct MovieDataDetailView: View {
    
    let movie: MovieDetailModel
    let isOnline: Bool
    @Binding var isLiked: Bool
    
    var action: ()-> ()
    
    var body: some View {
        GeometryReader{ proxy in
            VStack(alignment: .center, content: {
                if isOnline{
                    HStack(){
                        Spacer()
                        Image(systemName: "plus")
                            .resizable()
                            .movieAction()
                            .frame(width: proxy.size.width * 0.3)
                            .border(.white)
                        Spacer()
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .movieAction()
                            .frame(width: proxy.size.width * 0.3)
                            .border(.white)
                        Spacer()
                        Image(systemName: "heart.fill")
                            .resizable()
                            .movieAction()
                            .frame(width: proxy.size.width * 0.3)
                            .border(.white)
                    }
                    .border(.black)
                }
            })
        }
    }
}

#Preview {
    MovieDataDetailView(movie: MovieDetailModel(movieId: 0, adult: false, originalLanguage: "", originalTitle: "", overview: "", releaseDate: "", title: "", runtime: 0, posterPath: "", voteAvg: 0), isOnline: true, isLiked: .constant(false), action: {})
}
