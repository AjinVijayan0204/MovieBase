//
//  NetworkImageView.swift
//  MovieBase
//
//  Created by Ajin on 18/07/24.
//

import SwiftUI

struct NetworkImageView: View {
    
    let imgUrl: String
    
    var body: some View {
        HStack {
            Spacer()
            AsyncImage(url: URL(string: Config().imgBaseUrl+imgUrl)) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .tint(.white)
                
            }
            .frame(height: Screen.shared.height * 0.30)
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
    NetworkImageView(imgUrl: "vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg")
}
