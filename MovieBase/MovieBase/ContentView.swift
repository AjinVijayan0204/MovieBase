//
//  ContentView.swift
//  MovieBase
//
//  Created by Ajin on 07/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = MovieListViewModel()
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(vm.movies, id: \.self){ movie in
                    CardView(name: movie.originalTitle, url: Config().imgBaseUrl+movie.posterPath)
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
