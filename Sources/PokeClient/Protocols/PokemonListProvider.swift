//
//  PokemonListProvider.swift
//  PokeClient
//
//  Created by Pérsio on 18/04/20.
//

import Foundation

public protocol PokemonListProvider {
    
    /// Fetches Pokemon list
    /// - Parameters:
    ///   - offset: Pokemon list offset
    ///   - limit: Pokemon list limit
    ///   - completion: Completiion handler
    func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion)
}
