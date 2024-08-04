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
                Image("icon_header")
                    .resizable()
                    .frame(width: proxy.size.width * 0.2)
                    .border(.white)
                
                Spacer()
                    .frame(width: proxy.size.width * 0.5)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .foregroundStyle(.white)
                    .headerImageStyle()
                    .frame(height: proxy.size.height * 0.7)
                    .padding(.horizontal)
                    .border(.white)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .headerImageStyle()
                    .frame(height: proxy.size.height * 0.5)
                    .border(.white)
            }
            .padding(.top, proxy.size.height * 0.3)
            .frame(width: proxy.size.width, height: proxy.size.height)
            .ignoresSafeArea()
        }
    }
}

struct HeaderViewPreview: PreviewProvider{
    static var previews: some View {
        HeaderView()
    }
}
