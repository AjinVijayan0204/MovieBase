//
//  MovieListView.swift
//  MovieBase
//
//  Created by Ajin on 14/07/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var vm: MovieListViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading){
                NetworkImageView(imgUrl: vm.latest?.posterPath ?? "")
                    .onAppear{
                        vm.getLatestMovie()
                    }

                Text("Popular Movies")
                    .sectionHeader()
                HorizontalScrollView(listItems: $vm.popularMovies, action: vm.getMovieDetails(id:))
                    .onAppear{
                        vm.getPopularMovies()
                    }
                
                Text("Top Rated")
                    .sectionHeader()
                HorizontalScrollView(listItems: $vm.topRated, action: vm.getMovieDetails(id:))
                    .onAppear{
                        vm.getTopRatedMovie()
                    }
            }
            .padding(.bottom, 20)
            .frame(width: Screen.shared.width, alignment: .top)
            .padding(.top)
            .navigationDestination(isPresented: $vm.toDetailScreen) {
                MovieDetailView(vm: vm.movieDetailViewModel)
            }
        }
        .background(content: {
            Color.black
        })
    }
}


struct HorizontalScrollView: View{
    
    @Binding var listItems: [MovieCardModel]
    var action: (Int)-> ()
    
    var body: some View{
        ScrollView(.horizontal) {
            HStack{
                ForEach(listItems, id: \.self){ movie in
                    CardView(id: movie.movieId, name: movie.originalTitle, url: Config().imgBaseUrl+movie.posterPath, action: action)
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(vm: MovieListViewModel(movieUseCase: MovieUseCases(repo: MovieReposImpl(dataSource: MovieAPIImpl()))))
    }
}
