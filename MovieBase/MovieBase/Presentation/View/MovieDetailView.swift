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
            
        }
    }
}

struct MovieDataDetailView: View {
    
    let movie: MovieDetailModel
    let isOnline: Bool
    
    @Binding var isLiked: Bool
    
    var action: ()-> ()
    var body: some View {
        VStack(alignment: .leading){
            if isOnline{
                HStack(){
                    Spacer()
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20)
                        .movieAction()
                    Spacer()
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 20)
                        .movieAction()
                    Spacer()
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 20)
                        .foregroundStyle(isLiked ? .red : .white)
                        .movieAction()
                        .onTapGesture {
                            isLiked.toggle()
                            self.action()
                        }
                    Spacer()
                }
                .padding(.vertical, 10)
            }
           
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
                .font(.system(size: 14))
            .foregroundStyle(.white)
            .padding(.top, 8)
        }
    }
}

#Preview {
    MovieDetailView(vm:MovieDetailViewModel(selectedMovieId: 0,
                                            movieUseCase: MovieUseCasesImpl(
                                                repo: MovieReposImpl(
                                                    dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources())
                                            )
                                           )
    )
}
