//
//  FavoritePokemonOperation.swift
//  PokeClient
//
//  Created by Pérsio on 21/04/20.
//

import Foundation
import Core

class FavoritePokemonOperation: AsyncOperation {
    
    // MARK: Enums
    
    /// Operation mode enum
    enum Mode {
        case favorite
        case remove
    }
    
    // MARK: Properties
    
    private let provider: FavoritePokemonProvider
    private let mode: Mode
    private let pokemon: Pokemon
    private let completion: PokemonFavoriteCompletion
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - provider: A FavoritePokemonProvider adopter
    ///   - mode: Operation mode
    ///   - pokemon: The pokemon to be added or removed
    ///   - completion: Completion handler
    required init(provider: FavoritePokemonProvider, mode: Mode, pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        self.provider = provider
        self.mode = mode
        self.pokemon = pokemon
        self.completion = completion
    }
    
    // MARK: Method overrides
    
    override func main() {
        super.main()
        
        switch mode {
        case .favorite:
            provider.favoritePokemon(pokemon: pokemon) { [weak self] result in
                guard let self = self else { return }
                
                self.completion(result)
                self.finish()
            }
        case .remove:
            provider.removeFromFavorites(pokemon: pokemon) { [weak self] result in
                guard let self = self else { return }
                
                self.completion(result)
                self.finish()
            }
        }
    }
}
