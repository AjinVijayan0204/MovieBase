//
//  ContentView.swift
//  MovieBase
//
//  Created by Ajin on 07/07/24.
//

import SwiftUI

struct ContentView: View {
    
    let container: DependencyContainer
    
    
    init() {
        UIScrollView.appearance().bounces = false
        self.container = DependencyContainer()
       }
    
    var body: some View {
        NavigationStack {
            HomeTabView(container: container)
                .ignoresSafeArea()
        }.tint(.white)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
