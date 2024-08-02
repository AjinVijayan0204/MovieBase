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
        GeometryReader { proxy in
            VStack{
                if let movie = vm.movie{
                    ScrollView(.vertical) {
                        VStack(alignment: .leading){
                            
                            ZStack(alignment: .bottomTrailing) {
                                NetworkImageView(mode: .card,
                                                 id: movie.movieId,
                                                 imgUrl: movie.posterPath,
                                                 action: vm.dummy(num:))
                                .frame(height: proxy.size.height * 0.35)
                                
                            }
                            
                            MovieDataDetailView(movie: movie, 
                                                isLiked: $vm.isLiked,
                                                action: vm.addFavourite)

                        }
                    }
                }else{
                    ProgressView()
                        .tint(Color.white)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        
                }
            }
            .padding(.horizontal)
            .background(Color.black)
            .onAppear{
                vm.getMovieDetails()
            }
        }
    }
}

struct MovieDataDetailView: View {
    
    let movie: MovieDetailModel
    @Binding var isLiked: Bool
    
    var action: ()-> ()
    var body: some View {
        VStack(alignment: .leading){
            
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
