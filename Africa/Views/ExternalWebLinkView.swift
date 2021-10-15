//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-18.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "http://wikipedia.com")!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = try! Bundle.main.decode(from: "animals")

    static var previews: some View {
        ExternalWebLinkView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
