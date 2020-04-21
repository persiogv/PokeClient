//
//  PokemonAbility.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation

/// Pokemon ability model
public struct PokemonAbility: Decodable {
    
    // MARK: Coding keys
    
    private enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
    // MARK: Properties
    
    public let ability: Ability?
    public let isHidden: Bool?
    public let slot: Int?
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - ability: An Ability instance
    ///   - isHidden: Hidden boolean
    ///   - slot: Ability slot value
    public init(ability: Ability?, isHidden: Bool?, slot: Int?) {
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}
