//
//  FavouritesView.swift
//  MovieBase
//
//  Created by Ajin on 30/07/24.
//

import SwiftUI
import SwiftData

struct FavouritesView: View {
    
    @ObservedObject var vm: FavouritesViewModel
    
    var body: some View {
        NavigationStack{
            GeometryReader { proxy in
                VStack(alignment: .leading){
                    let columns = Array(repeating: GridItem(), count: 3)
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns, spacing: 20, content: {
                            ForEach(vm.movies, id: \.self){ movie in
                                OfflineImageView(movie: movie, action: vm.moveToDetailView(_:))
                                    .frame(width: proxy.size.width * 0.3, height: proxy.size.height * 0.3)
                            }
                        })
                        Spacer()
                            .frame(height: UITabBarController().tabBar.frame.height * 2)
                    }
                    .onAppear{
                        vm.getSavedMovies()
                    }
                }
                .navigationDestination(isPresented: $vm.toDetailView) {
                    MovieDetailView(vm: vm.movieDetailViewModel)
                    }
                .background(Color.black)
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        Text("Favourites")
                            .foregroundStyle(.white)
                            .bold()
                    }
                })
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    FavouritesView(vm: FavouritesViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSourcesImpl()))))
}
