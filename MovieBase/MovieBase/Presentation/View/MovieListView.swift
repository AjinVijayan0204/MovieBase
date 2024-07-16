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
        ScrollView(.horizontal){
            VStack {
                HStack {
                    ForEach(vm.movies, id: \.self){ movie in
                        CardView(name: movie.originalTitle, url: Config().imgBaseUrl+movie.posterPath)
                    }
                }
            }
        }
        .frame(width: Screen.shared.width, height: Screen.shared.height)
        .background(content: {
            Color.black
        })
        .onAppear{
            vm.getMovies()
        }
    }
}

struct HorizontalScrollView: View{
    
    var body: some View{
        HStack{
            
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
