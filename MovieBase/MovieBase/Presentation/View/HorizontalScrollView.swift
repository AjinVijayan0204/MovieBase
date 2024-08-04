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
        VStack{
            
        }
    }
}

#Preview {
    HorizontalScrollView(vm: HorizontalScrollViewModel(type: MovieEndpoint.latest, movieUseCase: MovieUseCasesImpl(repo: MovieReposImpl(dataSource: MovieAPIImpl(), localDataSource: SwiftDataSources())), action: { _ in
        
    }))
}
