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
        VStack{
            
        }
    }
}

#Preview {
    TrendingMovies(vm: TrendingMovieViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources())), action: { _ in
        
    }))
}
