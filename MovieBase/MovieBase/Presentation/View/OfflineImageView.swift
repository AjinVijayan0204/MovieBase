//
//  OfflineImageView.swift
//  MovieBase
//
//  Created by Ajin on 02/08/24.
//

import SwiftUI

struct OfflineImageView: View {
    let data: Data
    var body: some View {
        GeometryReader { proxy in
            Image(uiImage: UIImage(data: data) ?? UIImage())
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    OfflineImageView(data: Data())
}
