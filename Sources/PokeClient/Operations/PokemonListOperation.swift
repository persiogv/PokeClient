//
//  PokemonListOperation.swift
//  PokeClient
//
//  Created by Pérsio on 18/04/20.
//

import Foundation
import Core

class PokemonListOperation: AsyncOperation {
    
    // MARK: Properties
    
    private let provider: PokemonListProvider
    private let offset: Int
    private let limit: Int
    private let completion: PokemonListCompletion
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - provider: A PokemonProvider adopter
    ///   - offset: Pokemon list offset
    ///   - limit: Pokemon list limit
    ///   - completion: Completion handler
    required init(provider: PokemonListProvider, offset: Int, limit: Int, completion: @escaping PokemonListCompletion) {
        self.provider = provider
        self.offset = offset
        self.limit = limit
        self.completion = completion
    }
    
    // MARK: Method overrides
    
    override func main() {
        super.main()
        
        provider.fetchPokemonList(offset: offset, limit: limit) { [weak self] result in
            guard let self = self else { return }
            
            self.completion(result)
            self.finish()
        }
    }
}
