//
//  Animal.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-13.
//

import Foundation

struct Animal: Decodable, Hashable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let image: String
    let gallery: [String]
    let fact: [String]
    let description: String
    let link: String
}
