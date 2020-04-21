//
//  FavoritePokemonProvider.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation

public protocol FavoritePokemonProvider {
    
    /// Checks if the given pokemon is favorite
    /// - Parameter pokemon: The pokemon to check
    func checkForFavorite(_ pokemon: Pokemon) -> Bool
    
    /// Fetches the user's favorited pokemons
    /// - Parameter completion: Completion handler
    func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion)
    
    /// Favorites the given pokemon
    /// - Parameters:
    ///   - pokemon: The pokemon to be favorited
    ///   - completion: Completion handler
    func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion)
    
    /// Removes the given pokemon from favorites
    /// - Parameters:
    ///   - pokemon: The pokemon to be removed
    ///   - completion: Completion handler
    func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion)
}
