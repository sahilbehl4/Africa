//
//  ContentView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-10.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = (try? Bundle.main.decode(from: "animals")) ?? []
    
    @State private var isGridViewActive: Bool = false
    @State private var columns = 2 {
        didSet {
            let value = (columns % 3) + 1
            gridLayout = Array(repeating: GridItem(), count: value)
            switch value {
            case 1:
                buttonImage = "rectangle.grid.1x2"
            case 2:
                buttonImage = "square.grid.2x2"
            case 3:
                buttonImage = "square.grid.3x2"
            default:
                break
            }
        }
    }
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State var gridLayout = Array(repeating: GridItem(), count: 2)
    @State var buttonImage = "square.grid.2x2"
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals, id: \.self) { animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        Credits()                      .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout) {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }.padding(10)
                        .animation(.easeIn)
                    }
                }
            }.navigationBarTitle("Africa",displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                         Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary :.accentColor)
                        })
                        
                        Button(action: {
                            if isGridViewActive {
                                columns += 1
                            }
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }, label: {
                         Image(systemName: buttonImage)
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
