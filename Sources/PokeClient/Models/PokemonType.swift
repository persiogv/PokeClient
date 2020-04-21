//
//  PokemonType.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation

/// Pokemin type model
public struct PokemonType: Decodable {
    
    // MARK: Properties
    
    public let slot: Int?
    public let type: Type?
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - slot: Type slot number
    ///   - type: A Type instance
    public init(slot: Int?, type: Type?) {
        self.slot = slot
        self.type = type
    }
}
