//
//  HeaderView.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader{ proxy in
            HStack{
                Image(systemName: "leaf.fill")
                    .resizable()
                    .headerImageStyle()
                    .frame(width: proxy.size.width * 0.15)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .headerImageStyle()
                    .frame(height: proxy.size.height * 0.04)
                    .padding(.horizontal)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .headerImageStyle()
                    .frame(height: proxy.size.height * 0.04)
            }
            .border(.black)
            .frame(height: proxy.size.height * 0.05)
        }
    }
}

struct HeaderViewPreview: PreviewProvider{
    static var previews: some View {
        HeaderView()
    }
}
