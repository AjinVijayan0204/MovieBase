//
//  MovieListView.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var vm: MovieListViewModel
    
    var body: some View {
        GeometryReader{ proxy in
            ZStack(alignment: .top){
                ScrollView(.vertical) {
                    TrendingMovies(vm: vm.trendingMovieVM)
                        .frame(height: proxy.size.height * 0.6)
                    
                    
                }
                
                HeaderView()
                    .frame(width: proxy.size.width * 0.98, height: proxy.size.height * 0.1)
                    .border(.white)
            }
            .background(.black)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MovieListView(vm: MovieListViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources()))))
}
