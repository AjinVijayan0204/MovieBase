//
//  ContentView.swift
//  MovieBase
//
//  Created by Ajin on 07/07/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        MovieListView()
            .ignoresSafeArea()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
