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
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text(vm.name)
                    .sectionHeader()
                ScrollView(.horizontal) {
                    LazyHStack{
                        ForEach(vm.moviesList, id: \.self){ movie in
                            CardView(id: movie.movieId,
                                     name: movie.originalTitle,
                                     url: movie.posterPath,
                                     action: vm.action)
                            .frame(width: proxy.size.width * 0.3)
                        }
                        CardView(id: 0, name: "", url: "", type: .loadMore) { _ in
                            //
                        }
                        .frame(width: proxy.size.width * 0.3)
                        .onAppear{
                            vm.loadNextPage()
                        }
                    }
                }
            }
            .frame(height: proxy.size.height)
        }
    }
}

#Preview {
    HorizontalScrollView(vm: HorizontalScrollViewModel(type: MovieEndpoint.latest, movieUseCase: MovieUseCases(repo: MovieReposImpl(dataSource: MovieAPIImpl())), action: { _ in
        
    }))
}
