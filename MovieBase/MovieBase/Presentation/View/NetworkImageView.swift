//
//  NetworkImageView.swift
//  MovieBase
//
//  Created by Ajin on 18/07/24.
//

import SwiftUI

struct NetworkImageView: View {
    
    let mode: ImageViewType
    let id: Int
    let imgUrl: String
    
    var action: (Int)-> ()
    var body: some View {
        GeometryReader { proxy in
            HStack {
                Spacer()
                CardView(id: id, name: "", url: imgUrl, action: action)
                Spacer()
            }
            .frame(height: proxy.size.height)
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    NetworkImageView(mode: .card, id: 0, imgUrl: "vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg", action: {_ in })
}
