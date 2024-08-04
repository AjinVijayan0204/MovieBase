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
        VStack{
            
        }
    }
}

#Preview {
    FavouritesView(vm: FavouritesViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources()))))
}
