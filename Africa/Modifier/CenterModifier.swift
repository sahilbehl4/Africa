//
//  CenterModifier.swift
//  Africa
//
//  Created by Sahil Behl on 2021-10-15.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
