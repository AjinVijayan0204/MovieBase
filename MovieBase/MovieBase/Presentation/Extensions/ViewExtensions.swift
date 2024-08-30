//
//  ViewExtensions.swift
//  MovieBase
//
//  Created by Ajin on 16/07/24.
//

import Foundation
import SwiftUI

extension View{
    func sectionHeader()-> some View{
        modifier(SectionHeader())
    }
    
    func movieHeader()-> some View{
        modifier(MovieHeader())
    }
    
    func movieAction()-> some View{
        modifier(DetailViewActions())
    }
    
    func headerImageStyle()-> some View{
        modifier(HeaderViewImage())
    }
    
    func setHeightRelativeToParent(_ height: Double)-> some View{
        modifier(HeightVertical(heightRatioWithParent: height))
    }
    
    func setWidthRelativeToParent(_ width: Double)-> some View{
        modifier(WidthHorizontal(widthRatioWithParent: width))
    }
}
