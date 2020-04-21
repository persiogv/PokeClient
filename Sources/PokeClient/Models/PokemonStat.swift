//
//  PokemonStat.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation

/// Pokemon stats model
public struct PokemonStat: Decodable {
    
    // MARK: Coding keys
    
    private enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
    
    // MARK: Properties
    
    public let baseStat: Int?
    public let effort: Int?
    public let stat: Stat?
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - baseStat: Base stat value
    ///   - effort: Effort value
    ///   - stat: A Stat instance
    public init(baseStat: Int?, effort: Int?, stat: Stat?) {
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
}
