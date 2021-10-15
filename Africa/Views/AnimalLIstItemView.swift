//
//  AnimalLIstItemView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-13.
//

import SwiftUI

struct AnimalListItemView: View {
    let animal: Animal
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
        
    }
}

class AnimalListItemView_Preview: PreviewProvider {
    static let animals: [Animal] = try! Bundle.main.decode(from: "animals")

    static var previews: some View {
        AnimalListItemView(animal: animals.first!).previewLayout(.sizeThatFits)
            .padding()
    }
    
}
