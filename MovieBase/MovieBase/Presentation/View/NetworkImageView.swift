//
//  NetworkImageView.swift
//  MovieBase
//
//  Created by Ajin on 18/07/24.
//

import SwiftUI

struct NetworkImageView: View {
    
    let mode: ImageViewType
    let imgUrl: String
    
    var body: some View {
        HStack {
            Spacer()
            AsyncImage(url: URL(string: Config().imgBaseUrl+imgUrl)) { img in
                img
                    .resizable()
                    .frame(height: Screen.shared.height * 0.30)
                    .aspectRatio(contentMode: (mode == .card) ? .fit : .fill)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(height: Screen.shared.height * 0.30)
                    .tint(.white)
                
            }
            .overlay(content: {
                Color.black
                    .opacity(0.4)
            })
            .clipShape(RoundedRectangle(cornerRadius: 20))
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    NetworkImageView(mode: .card, imgUrl: "vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg")
}
