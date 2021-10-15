//
//  Credits.swift
//  Africa
//
//  Created by Sahil Behl on 2021-10-15.
//

import SwiftUI

struct Credits: View {
    var body: some View {
        VStack {
            Image("launch-screen-image")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright © Sahil Behl
    All rights reserved
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
