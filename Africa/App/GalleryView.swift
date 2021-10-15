//
//  GalleryView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-10.
//

import SwiftUI

struct GalleryView: View {
    
    let animals: [Animal] = (try? Bundle.main.decode(from: "animals")) ?? []
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var selectedImage: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns: Double = 3
    
    func switchGrid() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumns))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                Slider(value: $gridColumns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumns) { _ in
                        switchGrid()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals, id: \.self) { animal in
                        Image(animal.image)
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFit()
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedImage = animal.image
                                haptics.impactOccurred()
                            }
                    }
                }
            }
            .animation(.easeIn)
            .onAppear(perform: {
                switchGrid()
            })
            .padding(.horizontal, 10)
            .padding(.vertical, 30)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
