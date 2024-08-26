//
//  HeaderView.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        
        HStack{
            Image("icon_header")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .containerRelativeFrame(.horizontal, { size, _ in
                    size * 0.3
                })
                .border(.black)

            
            Spacer()
                
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.white)
                .headerImageStyle()
                .containerRelativeFrame(.horizontal, { size, _ in
                    size * 0.1
                })
                .border(.black)
//                .frame(height: proxy.size.height * 0.4)
//                .padding(.horizontal, proxy.size.width * 0.01)
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .headerImageStyle()
                .containerRelativeFrame(.horizontal, { size, _ in
                    size * 0.1
                })
                .border(.black)
//                .frame(height: proxy.size.height * 0.4)
        }
        .ignoresSafeArea()
        .border(.black)
//        GeometryReader{ proxy in
//            
//            .padding(.top, proxy.size.height * 0.5)
//            .frame(width: proxy.size.width, height: proxy.size.height)
//            
//        }
        
    }
}

struct HeaderViewPreview: PreviewProvider{
    static var previews: some View {
        HeaderView()
    }
}
