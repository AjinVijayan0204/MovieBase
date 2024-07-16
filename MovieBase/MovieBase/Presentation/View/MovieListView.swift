//
//  MovieListView.swift
//  MovieBase
//
//  Created by Ajin on 14/07/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var vm = MovieListViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: "")) { img in
                    img
                        .resizable()
                        .frame(height: Screen.shared.height * 0.30)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(height: Screen.shared.height * 0.30)
                        .tint(.white)
                        .foregroundStyle(Color.white)
                }
                .padding(.top, Screen.shared.height * 0.1)

                Text("Popular Movies")
                    .sectionHeader()
                HorizontalScrollView(listItems: $vm.popularMovies)
                    .onAppear{
                        vm.getPopularMovies()
                    }
                
                Text("Top Rated")
                    .sectionHeader()
                HorizontalScrollView(listItems: $vm.topRated)
                    .onAppear{
                        vm.getTopRatedMovie()
                    }
            }
            .frame(width: Screen.shared.width,height: .infinity, alignment: .top)
            .padding(.leading)
        }
    }
}


struct HorizontalScrollView: View{
    
    @Binding var listItems: [MovieCardModel]
    
    var body: some View{
        ScrollView(.horizontal) {
            HStack{
                ForEach(listItems, id: \.self){ movie in
                    CardView(name: movie.originalTitle, url: Config().imgBaseUrl+movie.posterPath)
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
