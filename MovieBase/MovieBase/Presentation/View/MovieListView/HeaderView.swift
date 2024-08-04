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
                    .headerImageStyle()
                    .frame(height: proxy.size.height * 0.1)
                
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .headerImageStyle()
                    .frame(height: proxy.size.height * 0.03)
                    .padding(.horizontal)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .headerImageStyle()
                    .frame(height: proxy.size.height * 0.03)
            }
            .frame(height: proxy.size.height * 0.05)
            .padding(.top, proxy.size.height * 0.05)
            .ignoresSafeArea()
        }
    }
}

struct HeaderViewPreview: PreviewProvider{
    static var previews: some View {
        HeaderView()
    }
}
