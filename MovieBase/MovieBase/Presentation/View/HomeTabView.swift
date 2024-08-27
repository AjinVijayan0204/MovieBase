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
        NavigationStack {
            TabView {
                MovieListView(vm: container.movieListViewModel)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                FavouritesView(vm: container.favouritesViewModel)
                    .tabItem {
                        Label("Favourite", systemImage: "heart")
                    }
            }
            .tint(.white)
            .background(.black)
            .onAppear{
                UITabBar.appearance().unselectedItemTintColor = .gray
                UITabBar.appearance().backgroundColor = UIColor(named: "TabView Color")
            }
        }
    }
}

#Preview {
    HomeTabView(container: DependencyContainer())
}
