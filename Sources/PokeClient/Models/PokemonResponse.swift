//
//  PokemonResponse.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation

/// Pokemon response model
public struct PokemonResponse: Decodable {
    
    // MARK: Properties
    
    let count: Int?
    let next: String?
    let previous: String?
    public let results: [Pokemon]?
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - count: Total of pokemons
    ///   - next: Next pokemon url
    ///   - previous: Previous pokemon url
    ///   - results: Array of pokemons
    public init(count: Int?, next: String?, previous: String?, results: [Pokemon]?) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
