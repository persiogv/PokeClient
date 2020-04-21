//
//  PokemonListManager.swift
//  PokeClient
//
//  Created by Pérsio on 18/04/20.
//

import Foundation
import Core

class PokemonListManager: Manager {
    
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
    
    /// Fetches Pokemon list
    /// - Parameters:
    ///   - offset: Pokemon list offset
    ///   - limit: Pokemon list limit
    ///   - completion: Completiion handler
    func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion) {
        cancelAllOperations()
        
        let operation = PokemonListOperation(provider: provider, offset: offset, limit: limit) { [weak self] result in
            guard let self = self else { return }
            
            let completionOperation = BlockOperation { completion(result) }
            self.executeInMainQueue(operation: completionOperation)
        }
        
        addOperation(operation)
    }
}
