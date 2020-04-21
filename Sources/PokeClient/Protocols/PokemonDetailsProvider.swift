//
//  PokemonDetailsProvider.swift
//  PokeClient
//
//  Created by Pérsio on 19/04/20.
//

import Foundation

public protocol PokemonDetailsProvider {
    
    /// Fetches the details for the given Pokemon
    /// - Parameters:
    ///   - name: Pokemon's name
    ///   - completion: Completion handler
    func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion)
}
