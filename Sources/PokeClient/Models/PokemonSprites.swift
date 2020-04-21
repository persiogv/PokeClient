//
//  PokemonSprites.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation

/// Pokemon sprites model
public struct PokemonSprites: Decodable {
    
    // MARK: Coding keys
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
    
    // MARK: Properties
    
    public let frontDefault: String?
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter frontDefault: Front default sprite URL
    public init(frontDefault: String?) {
        self.frontDefault = frontDefault
    }
}
