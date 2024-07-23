//
//  TrendingMovies.swift
//  MovieBase
//
//  Created by Ajin on 18/07/24.
//

import SwiftUI

struct TrendingMovies: View {
    
    @StateObject var vm: TrendingMovieViewModel
    
    var body: some View {
        TabView(selection: $vm.selectedIndex,
                content:  {
            ForEach(0..<5) { index in
                
                NetworkImageView(mode: .expanded,
                                 id: vm.upcoming[index].movieId,
                                 imgUrl: vm.upcoming[index].posterPath,
                                 action: vm.action)
                .tag(index)
            }
        })
        .tabViewStyle(.page)
        .background(Color.black)
        .onAppear{
            vm.getUpcomingMovies()
        }
    }
}

#Preview {
    TrendingMovies(vm: TrendingMovieViewModel(movieUseCase: MovieUseCases(repo: MovieReposImpl(dataSource: MovieAPIImpl())), action: { _ in
        
    }))
}
