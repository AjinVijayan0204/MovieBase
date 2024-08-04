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
            .font(.title3)
            .bold()
            .foregroundStyle(.white)
    }
}

struct DetailViewActions: ViewModifier{
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundStyle(.black)
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
