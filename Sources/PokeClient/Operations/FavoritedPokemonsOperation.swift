//
//  FavoritedPokemonsOperation.swift
//  PokeClient
//
//  Created by Pérsio on 21/04/20.
//

import Foundation
import Core

class FavoritedPokemonsOperation: AsyncOperation {
    
    // MARK: Properties
    
    private let provider: FavoritePokemonProvider
    private let completion: PokemonListCompletion
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - provider: A FavoritePokemonProvider adopter
    ///   - completion: Completion handler
    required init(provider: FavoritePokemonProvider, completion: @escaping PokemonListCompletion) {
        self.provider = provider
        self.completion = completion
    }
    
    // MARK: Method overrides
    
    override func main() {
        super.main()
        
        provider.fetchFavoritedPokemons { [weak self] result in
            guard let self = self else { return }
            
            self.completion(result)
            self.finish()
        }
    }
}
