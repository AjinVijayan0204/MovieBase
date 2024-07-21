//
//  HorizontalScrollView.swift
//  MovieBase
//
//  Created by Ajin on 20/07/24.
//

import SwiftUI

struct HorizontalScrollView: View{
    
    @StateObject var vm: HorizontalScrollViewModel
    
    var body: some View{
        VStack(alignment: .leading) {
            Text(vm.name)
                .sectionHeader()
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(vm.moviesList, id: \.self){ movie in
                        CardView(id: movie.movieId,
                                 name: movie.originalTitle,
                                 url: Config().imgBaseUrl+movie.posterPath,
                                 action: vm.action)
                    }
                    CardView(id: 0, name: "", url: "", type: .loadMore) { _ in
                        //
                    }
                    .onAppear{
                        vm.loadNextPage()
                    }
                }
                .frame(height: Screen.shared.height * 0.3)
            }
        }
    }
}

#Preview {
    HorizontalScrollView(vm: HorizontalScrollViewModel(type: MovieEndpoint.latest, movieUseCase: MovieUseCases(repo: MovieReposImpl(dataSource: MovieAPIImpl())), action: { _ in
        
    }))
}
