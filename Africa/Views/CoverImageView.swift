//
//  CoverImageView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-10.
//

import SwiftUI

struct CoverImageView: View {
    
    private let covers: [Cover] = (try? Bundle.main.decode(from: "covers")) ?? []
    
    var body: some View {
        TabView {
            ForEach(covers, id: \.id) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Preview: PreviewProvider {
    static var previews: some View {
        CoverImageView().previewLayout(.fixed(width: 400, height: 300))
    }
}
