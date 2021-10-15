//
//  MapAnnotationVIew.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-24.
//

import SwiftUI

struct MapAnnotationVIew: View {
    let location: Location
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .fill(Color.white)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 48, height: 48, alignment: .center)
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationVIew_Previews: PreviewProvider {
    static let locations: [Location] = try! Bundle.main.decode(from: "locations")
    static var previews: some View {
        MapAnnotationVIew(location: locations.first!).previewLayout(.sizeThatFits).padding()
    }
}
