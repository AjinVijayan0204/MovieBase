//
//  CardView.swift
//  MovieBase
//
//  Created by Ajin on 04/08/24.
//

import SwiftUI

struct CardView: View {
    
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
    
    var body: some View {
        ZStack(alignment: .center){
            if(type == .normal){
                AsyncImage(url: URL(string: Config().imgBaseUrl + url)) { img in
                    ZStack{
                        img
                            .resizable()
                        Color.black
                            .opacity(0.4)
                    }
                } placeholder: {
                    SkeletonCardLoader()
                }

            }else{
                ZStack{
                    SkeletonCardLoader()
                    ProgressView()
                }
                
            }
        }.clipShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                action(id)
            }
    }
}

#Preview {
    CardView(id: 0, name: "", url: "", type: .normal) { _ in
        //
    }
}
