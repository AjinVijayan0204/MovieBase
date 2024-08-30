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
    let columns = Array(repeating: GridItem(), count: 3)
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading){
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, spacing: 20, content: {
                        ForEach(vm.movies, id: \.self){ movie in
                            OfflineImageView(movie: movie, action: vm.moveToDetailView(_:))
                                .setHeightRelativeToParent(0.3)
                        }
                    })
                }
                .onAppear{
                    vm.getSavedMovies()
                }
            }
            .padding(.top, UINavigationBar.appearance().frame.height)
            .background(.black)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("Favourites")
                        .foregroundStyle(.white)
                        .bold()
                }
            })
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $vm.toDetailView) {
                MovieDetailView(vm: vm.movieDetailViewModel)
            }
            .toolbarBackground(.opacity(0.6), for: .navigationBar)
        }
        .background(.black)
    }
}

#Preview {
    FavouritesView(vm: FavouritesViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSourcesImpl()))))
}
