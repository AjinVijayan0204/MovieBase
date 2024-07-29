//
//  HomeTabView.swift
//  MovieBase
//
//  Created by Ajin on 29/07/24.
//

import SwiftUI

struct HomeTabView: View {
    
    let container: DependencyContainer
    
    var body: some View {
        TabView {
            MovieListView(vm: container.movieListViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Two")
                .tabItem {
                    Label("Favourite", systemImage: "heart")
                }
        }
        .tint(.white)
        .onAppear{
            UITabBar.appearance().barTintColor = .black
            UITabBar.appearance().backgroundColor = .black
        }
    }
}

#Preview {
    HomeTabView(container: DependencyContainer())
}
