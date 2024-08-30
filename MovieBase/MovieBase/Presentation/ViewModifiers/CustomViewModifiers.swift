//
//  CustomViewModifiers.swift
//  MovieBase
//
//  Created by Ajin on 16/07/24.
//

import Foundation
import SwiftUI

struct SectionHeader: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .padding(.top)
    }
}

struct MovieHeader: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28))
            .bold()
            .foregroundStyle(.white)
    }
}

struct DetailViewActions: ViewModifier{
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundStyle(.white)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct HeaderViewImage: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct HeightVertical: ViewModifier{
    var heightRatioWithParent: Double
    
    init(heightRatioWithParent: Double) {
        self.heightRatioWithParent = heightRatioWithParent
    }
    
    func body(content: Content) -> some View {
        content
            .containerRelativeFrame(.vertical) { height, _ in
                height * heightRatioWithParent
            }
    }
}

struct WidthHorizontal: ViewModifier{
    var widthRatioWithParent: Double
    
    init(widthRatioWithParent: Double) {
        self.widthRatioWithParent = widthRatioWithParent
    }
    
    func body(content: Content) -> some View {
        content
            .containerRelativeFrame(.horizontal) { width, _ in
                width * widthRatioWithParent
            }
    }
}
