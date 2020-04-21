//
//  PokemonDetailsOperation.swift
//  PokeClient
//
//  Created by Pérsio on 18/04/20.
//

import Foundation
import Core

class PokemonDetailsOperation: AsyncOperation {
    
    // MARK: Properties
    
    private let provider: PokemonDetailsProvider
    private let pokemon: Pokemon
    private let completion: PokemonDetailsCompletion
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - provider: A PokemonDetailsProvider adopter
    ///   - pokemon: The Pokemon to get its details
    ///   - completion: Completion handler
    required init(provider: PokemonDetailsProvider, pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion) {
        self.provider = provider
        self.pokemon = pokemon
        self.completion = completion
    }
    
    // MARK: Method overrides
    
    override func main() {
        super.main()
        
        provider.fetchPokemonDetails(pokemon: pokemon) { [weak self] result in
            guard let self = self else { return }
            
            self.completion(result)
            self.finish()
        }
    }
}
