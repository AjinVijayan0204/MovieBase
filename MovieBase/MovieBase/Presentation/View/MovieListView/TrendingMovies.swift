//
//  TrendingMovies.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct TrendingMovies: View {
    @StateObject var vm: TrendingMovieViewModel
    var body: some View {
        TabView(selection: $vm.selectedIndex,
                content:  {
            ForEach(0..<5) { index in
                TrendingMovieLoader(mode: .expanded,
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
    TrendingMovies(vm: TrendingMovieViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources())), action: { _ in
        
    }))
}
