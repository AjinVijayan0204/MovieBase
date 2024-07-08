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
        VStack {
            List{
                ForEach(vm.movies, id: \.self) { movie in
                    Text(movie.originalTitle)
                }
            }
        }
        .padding()
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
