//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle: Int = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    func randomCoordinate(maxValue: CGFloat) -> CGFloat {
        CGFloat.random(in: 0..<maxValue)
    }
    
    func randomSize() -> CGFloat {
        .random(in: 10...300)
    }
    
    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(CGPoint(x: randomCoordinate(maxValue: geo.size.width),
                                          y: randomCoordinate(maxValue:geo.size.height)))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
            }.drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
