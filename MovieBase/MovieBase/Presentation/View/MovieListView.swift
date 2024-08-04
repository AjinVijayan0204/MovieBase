//
//  MovieListView.swift
//  MovieBase
//
//  Created by Ajin on 14/07/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var vm: MovieListViewModel
    
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                HeaderView()
                    .border(.black)
            }
            .padding(.horizontal, proxy.size.width * 0.05)
            .padding(.top, proxy.size.height * 0.05)
        }
        .background(.black)
        .ignoresSafeArea()
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(vm: MovieListViewModel(movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources()))))
    }
}
