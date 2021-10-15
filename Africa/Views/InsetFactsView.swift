//
//  InsetFactsView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-17.
//

import SwiftUI

struct InsetFactsView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFactsView_Previews: PreviewProvider {
    static let animals: [Animal] = try! Bundle.main.decode(from: "animals")

    static var previews: some View {
        InsetFactsView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
