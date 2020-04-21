//
//  PokemonGameIndex.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation

/// Pokemon game index model
public struct PokemonGameIndex: Decodable {
    
    // MARK: Coding keys
    
    private enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
    
    // MARK: Properties
    
    public let gameIndex: Int?
    public let version: Version?
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - gameIndex: Game index
    ///   - version: A Version instance
    public init(gameIndex: Int?, version: Version?) {
        self.gameIndex = gameIndex
        self.version = version
    }
}
