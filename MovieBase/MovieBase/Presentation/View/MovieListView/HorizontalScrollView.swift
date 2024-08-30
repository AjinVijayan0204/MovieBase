//
//  HorizontalScrollView.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct HorizontalScrollView: View {
    @StateObject var vm: HorizontalScrollViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text(vm.name)
                .sectionHeader()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(content: {
                    ForEach(vm.moviesList, id: \.self) { movie in
                        CardView(id: movie.movieId,
                                 name: movie.originalTitle,
                                 url: movie.posterPath,
                                 action: vm.action)
                        .containerRelativeFrame(.horizontal) { size, _ in
                            size * 0.3
                        }
                    }
                    CardView(id: 0, name: "", url: "", type: .loadMore) { _ in
                        //
                    }
                    .containerRelativeFrame(.horizontal) { size, _ in
                        size * 0.3
                    }
                    .onAppear{
                        vm.loadNextPage()
                    }
                })
            }
        }
    }
}

#Preview {
    HorizontalScrollView(vm: HorizontalScrollViewModel(type: MovieEndpoint.latest, movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSourcesImpl())), action: { _ in
        
    }))
}
