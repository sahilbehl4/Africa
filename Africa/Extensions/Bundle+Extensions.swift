//
//  Bundle+Extensions.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-10.
//

import Foundation

enum AfricaError: Error {
    case cannotLocateFile
    
}

extension Bundle {
    func decode<T: Decodable>(from file: String) throws -> [T] {
        guard let url = url(forResource: file, withExtension: "json") else {
            throw AfricaError.cannotLocateFile
        }
        
        let data = try Data(contentsOf: url)
        let decodeData = try JSONDecoder().decode([T].self, from: data)
        return decodeData
    }
}
