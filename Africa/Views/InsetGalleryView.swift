//
//  InsertImageGallery.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-17.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = try! Bundle.main.decode(from: "animals")
    static var previews: some View {
        InsetGalleryView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
