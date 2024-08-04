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
        VStack{
            
        }
    }
}

struct AnimatedCard: View {
    
    private var gradientColors = [
           Color(uiColor: UIColor.systemGray5),
           Color(uiColor: UIColor.systemGray6),
           Color(uiColor: UIColor.systemGray5)
       ]
       @State var startPoint: UnitPoint = .init(x: -1.8, y: -1.2)
       @State var endPoint: UnitPoint = .init(x: 0, y: -0.2)
    
    let colors: [Color] = [Color(uiColor: UIColor.systemGray5),
                           Color(uiColor: UIColor.systemGray6),
                           Color(uiColor: UIColor.systemGray5)]
    var body: some View {
        LinearGradient (colors: gradientColors,
                         startPoint: startPoint,
                         endPoint: endPoint)
         .onAppear {
             withAnimation (.easeInOut (duration: 1)
                 .repeatForever (autoreverses: false)) {
                     startPoint = .init(x: 1, y: 1)
                     endPoint = .init(x: 2.2, y: 2.2)
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
        CardView(id: 0, name: "", url: "", type: .normal) { _ in
            //
        }
    }
}
