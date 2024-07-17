//
//  CardView.swift
//  MovieBase
//
//  Created by Ajin on 11/07/24.
//

import SwiftUI

struct CardView: View{
    
    let id: Int
    let name: String
    let url: String
    
    var action: (Int)-> ()
    
    var body: some View{
        Rectangle()
            .foregroundStyle(Color.white)
            .overlay{
                ZStack(alignment: .bottomLeading) {
                    AsyncImage(url: URL(string: url)) { img in
                        img
                            .resizable()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                    }
                    Color.black
                        .opacity(0.4)
                }
            }
            .frame(width: Screen.shared.width * 0.3, height: Screen.shared.width * 0.5)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                action(id)
            }
            
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(id: 0,name: "", url: "") { _ in
            
        }
    }
}
