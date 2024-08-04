//
//  TrendingMovieLoader.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct TrendingMovieLoader: View {
    
    let mode: ImageViewType
    let id: Int
    let imgUrl: String
    
    var action: (Int)-> ()
    
    var body: some View {
        GeometryReader { proxy in
            AsyncImage(url: URL(string: Config().imgBaseUrl + imgUrl)) { Img in
                Img
                    .resizable()
            } placeholder: {
                AnimatedCard()
            }

        }
    }
}

#Preview {
    TrendingMovieLoader(mode: .card, id: 0, imgUrl: "vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg", action: {_ in })
}
