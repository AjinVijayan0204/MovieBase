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
            VStack(alignment: .leading, content: {
                if isOnline{
                    HStack(){
                        Spacer()
                        Image(systemName: "plus")
                            .resizable()
                            .movieAction()
                            
                        Spacer()
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .movieAction()
                            
                        Spacer()
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundStyle(self.isLiked ? .red : .white)
                            .movieAction()
                            .onTapGesture {
                                isLiked.toggle()
                                self.action()
                            }
                        Spacer()
                            
                    }
                    .frame(height: proxy.size.height * 0.05)
                    
                }
                
                VStack(alignment: .leading){
                    Text(movie.originalTitle)
                        .movieHeader()
                        .padding(.vertical, 10)
                    
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
                        .font(.system(size: (UIDevice.current.userInterfaceIdiom == .pad) ? 25 : 14))
                        .foregroundStyle(.white)
                        .padding(.top, 8)
                }
                .padding(.horizontal)
                    
            })
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .top)
            .background(.black)
        }
    }
}

#Preview {
    MovieDataDetailView(movie: MovieDetailModel(movieId: 0, adult: false, originalLanguage: "", originalTitle: "", overview: "", releaseDate: "", title: "", runtime: 0, posterPath: "", voteAvg: 0), isOnline: true, isLiked: .constant(false), action: {})
}
