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
    let type: CardViewType
    
    var action: (Int)-> ()
    
    init(id: Int, name: String, url: String, type: CardViewType = .normal, action: @escaping (Int) -> Void) {
        self.id = id
        self.name = name
        self.url = url
        self.type = type
        self.action = action
    }
    
    var body: some View{
        GeometryReader { proxy in
            Rectangle()
                .foregroundStyle(Color.white)
                .overlay{
                    ZStack() {
                        if (type == .normal) {
                            AsyncImage(url: URL(string: Config().imgBaseUrl + url)) { img in
                                img
                                    .resizable()
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                            }
                        } else {
                            ProgressView()
                                .tint(.black)
                        }
                        Color.black
                            .opacity(0.4)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    action(id)
            }
                
        }
            
    }
}

enum CardViewType{
    case normal
    case loadMore
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(id: 0, name: "", url: "vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg", type: .normal) { _ in
            //
        }
    }
}
