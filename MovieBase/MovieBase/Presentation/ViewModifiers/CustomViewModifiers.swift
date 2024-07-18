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
