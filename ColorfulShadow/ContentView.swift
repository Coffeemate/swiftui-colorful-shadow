//
//  ContentView.swift
//  ColorfulShadow
//
//  Created by Vitaliy Petrushenko on 23.03.2020.
//  Copyright © 2020 BetterLab. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var imgIndex = 1
    @State private var isDark = false
    @State private var radius: CGFloat = 40
    @State private var scale: CGFloat = 1
    @State private var yOffset: CGFloat = 0
    @State private var saturation: Double = 1
    
    var body: some View {
        ZStack {
            Color.init(white: isDark ? 0.2 : 1)
                .animation(Animation.timingCurve(0.25, 1, 0.5, 1, duration: 0.5))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    self.isDark.toggle()
                }) {
                    Image(systemName: isDark ? "moon.fill" : "sun.max.fill")
                        .font(.largeTitle)
                        .animation(.easeInOut(duration: 0.4))
                        .padding(40)
                }
                
                Spacer()
                
                Image("img-\(self.imgIndex)")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                    .colorfulShadow(radius: radius, scale: scale, yOffset: yOffset, saturation: saturation)
                    .onTapGesture(perform: nextImg )
                    .frame(maxWidth: 500)
                    .padding(40)
                
                Spacer()
                
                VStack {
                    Text("Radius")
                    Slider(value: $radius, in: 0...200)
                }
                .padding()
                
                VStack {
                    Text("Scale")
                    Slider(value: $scale, in: 0...2)
                }
                .padding()
                
                VStack {
                    Text("Y Offset")
                    Slider(value: $yOffset, in: 0...40)
                }
                .padding()
                
                VStack {
                    Text("Saturation")
                    Slider(value: $saturation, in: 0...5)
                }
                .padding()
            }
            .foregroundColor(isDark ? .white : Color.init(white: 0.3))
        }
    }
    
    func nextImg() {
        if imgIndex == 6 {
            self.imgIndex = 0
        } else {
            self.imgIndex += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
