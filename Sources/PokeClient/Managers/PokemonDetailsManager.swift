//
//  PokemonDetailsManager.swift
//  PokeClient
//
//  Created by Pérsio on 19/04/20.
//

import Foundation
import Core

class PokemonDetailsManager: Manager {
    
    // MARK: Properties
    
    private let provider: PokemonProvider
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter provider: A PokemonProvider adopter
    required init(provider: PokemonProvider) {
        self.provider = provider
        super.init()
    }
    
    // MARK: Public methods
    
    /// Fetches the details for the given Pokemon
    /// - Parameters:
    ///   - name: Pokemon's name
    ///   - completion: Completion handler
    func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion) {
        cancelAllOperations()
        
        let operation = PokemonDetailsOperation(provider: provider, pokemon: pokemon) { [weak self] result in
            guard let self = self else { return }
            
            let completionOperation = BlockOperation { completion(result) }
            self.executeInMainQueue(operation: completionOperation)
        }
        
        addOperation(operation)
    }
}
