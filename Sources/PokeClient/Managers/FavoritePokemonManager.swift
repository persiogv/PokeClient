//
//  FavoritePokemonManager.swift
//  PokeClient
//
//  Created by Pérsio on 21/04/20.
//

import Foundation
import Core

class FavoritePokemonManager: Manager {
    
    // MARK: Properties
    
    private let provider: FavoritePokemonProvider
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter provider: A PokemonProvider adopter
    required init(provider: FavoritePokemonProvider) {
        self.provider = provider
        super.init()
    }
    
    // MARK: Public methods
    
    /// Fetches the user's favorited pokemons
    /// - Parameter completion: Completion handler
    func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion) {
        cancelAllOperations()
        
        let operation = FavoritedPokemonsOperation(provider: provider) { [weak self] result in
            guard let self = self else { return }
            
            let completionOperation = BlockOperation { completion(result) }
            self.executeInMainQueue(operation: completionOperation)
        }
        
        addOperation(operation)
    }
    
    /// Favorites the given pokemon
    /// - Parameters:
    ///   - pokemon: The pokemon to be favorited
    ///   - completion: Completion handler
    func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        cancelAllOperations()
        
        let operation = FavoritePokemonOperation(provider: provider, mode: .favorite, pokemon: pokemon) { [weak self] result in
            guard let self = self else { return }
            
            let completionOperation = BlockOperation { completion(result) }
            self.executeInMainQueue(operation: completionOperation)
        }
        
        addOperation(operation)
    }
    
    /// Removes the given pokemon from favorites
    /// - Parameters:
    ///   - pokemon: The pokemon to be removed
    ///   - completion: Completion handler
    func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        cancelAllOperations()
        
        let operation = FavoritePokemonOperation(provider: provider, mode: .remove, pokemon: pokemon) { [weak self] result in
            guard let self = self else { return }
            
            let completionOperation = BlockOperation { completion(result) }
            self.executeInMainQueue(operation: completionOperation)
        }
        
        addOperation(operation)
    }
}
