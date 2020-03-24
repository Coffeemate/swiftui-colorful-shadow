//
//  ColorfulShadow.swift
//  ColorfulShadow
//
//  Created by Vitaliy Petrushenko on 23.03.2020.
//  Copyright © 2020 BetterLab. All rights reserved.
//

import SwiftUI

struct ColorfulShadow: ViewModifier {
    let radius: CGFloat
    let scale: CGFloat
    let xOffset: CGFloat
    let yOffset: CGFloat
    let saturation: Double
    
    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    content
                        .offset(x: xOffset, y: yOffset)
                        .scaleEffect(scale)
                        .saturation(saturation)
                        .blur(radius: radius)
                    content
                        .offset(x: xOffset, y: yOffset)
                        .scaleEffect(scale)
                        .saturation(saturation)
                        .blur(radius: radius)
                }
                .accessibility(hidden: true)
            )
    }
}

extension View {
    /// Adds a colorful shadow to the view.
    func colorfulShadow(radius: CGFloat, scale: CGFloat = 1, xOffset: CGFloat = 0, yOffset: CGFloat = 0, saturation: Double = 1) -> some View {
        self.modifier(ColorfulShadow(radius: radius, scale: scale, xOffset: xOffset, yOffset: yOffset, saturation: saturation))
    }
}

