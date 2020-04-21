//
//  PokemonDetails.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation

/// Pokemon details model
public struct PokemonDetails: Decodable {
    
    // MARK: Coding keys
    
    private enum CodingKeys: String, CodingKey {
        case abilities
        case gameIndices = "game_indices"
        case height
        case name
        case order
        case species
        case sprites
        case stats
        case types
        case weight
    }
    
    // MARK: Properties
    
    public let abilities: [PokemonAbility]?
    public let gameIndices: [PokemonGameIndex]?
    public let height: Int?
    public let name: String?
    public let order: Int?
    public let species: PokemonSpecies?
    public let sprites: PokemonSprites?
    public let stats: [PokemonStat]?
    public let types: [PokemonType]?
    public let weight: Int?
    
    // MARK: Initializer
    
    /// Initializer
    /// - Parameters:
    ///   - abilities: Pokemon abilities
    ///   - gameIndices: Pokemon game indices
    ///   - height: Pokemon height
    ///   - name: Pokemon name
    ///   - order: Pokemon order
    ///   - species: Pokemon species
    ///   - sprites: Pokemon sprites
    ///   - stats: Pokemon stats
    ///   - types: Pokemon types
    ///   - weight: Pokemon weight
    public init(abilities: [PokemonAbility]?,
                gameIndices: [PokemonGameIndex]?,
                height: Int?,
                name: String?,
                order: Int?,
                species: PokemonSpecies?,
                sprites: PokemonSprites?,
                stats: [PokemonStat]?,
                types: [PokemonType]?,
                weight: Int?) {
        self.abilities = abilities
        self.gameIndices = gameIndices
        self.height = height
        self.name = name
        self.order = order
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
        self.weight = weight
    }
}
