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
        AsyncImage(url: URL(string: Config().imgBaseUrl+imgUrl)) { img in
            img
                .resizable()
                .frame(height: Screen.shared.height * 0.30)
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .frame(height: Screen.shared.height * 0.30)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NetworkImageView(imgUrl: "")
}
