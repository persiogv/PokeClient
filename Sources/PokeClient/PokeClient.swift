//
//  PokeClient.swift
//  PokeClient
//
//  Created by Pérsio on 18/04/20.
//

import Foundation

public final class PokeClient {
    
    // MARK: Properties
    
    private let pokemonProvider: PokemonProvider
    private let favoriteProvider: FavoritePokemonProvider
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - pokemonProvider: A PokemonProvider adopter
    ///   - favoriteProvider: A FavoritePokemonProvider adopter
    init(pokemonProvider: PokemonProvider, favoriteProvider: FavoritePokemonProvider) {
        self.pokemonProvider = pokemonProvider
        self.favoriteProvider = favoriteProvider
    }
    
    /// Public convenience init
    public convenience init() {
        self.init(pokemonProvider: PokeApiProvider(), favoriteProvider: WebhookProvider())
    }
}

// MARK: - Pokemon provider
extension PokeClient: PokemonProvider {
    
    /// Fetches pokemon list
    /// - Parameters:
    ///   - offset: Pokemon list offset
    ///   - limit: Pokemon list limit
    ///   - completion: Completiion handler
    public func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion) {
        let manager = PokemonListManager(provider: pokemonProvider)
        manager.fetchPokemonList(offset: offset, limit: limit, completion: completion)
    }
    
    /// Fetches the details for the given Pokemon
    /// - Parameters:
    ///   - name: Pokemon's name
    ///   - completion: Completion handler
    public func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion) {
        let manager = PokemonDetailsManager(provider: pokemonProvider)
        manager.fetchPokemonDetails(pokemon: pokemon, completion: completion)
    }
}

// MARK: - Favorite pokemon provider
extension PokeClient: FavoritePokemonProvider {
    
    /// Checks if the given pokemon is favorite
    /// - Parameter pokemon: The pokemon to check
    public func checkForFavorite(_ pokemon: Pokemon) -> Bool {
        return favoriteProvider.checkForFavorite(pokemon)
    }
    
    /// Fetches the user's favorited pokemons
    /// - Parameter completion: Completion handler
    public func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion) {
        let manager = FavoritePokemonManager(provider: favoriteProvider)
        manager.fetchFavoritedPokemons(completion: completion)
    }
    
    /// Favorites the given pokemon
    /// - Parameters:
    ///   - pokemon: The pokemon to be favorited
    ///   - completion: Completion handler
    public func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        let manager = FavoritePokemonManager(provider: favoriteProvider)
        manager.favoritePokemon(pokemon: pokemon, completion: completion)
    }
    
    /// Removes the given pokemon from favorites
    /// - Parameters:
    ///   - pokemon: The pokemon to be removed
    ///   - completion: Completion handler
    public func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        let manager = FavoritePokemonManager(provider: favoriteProvider)
        manager.removeFromFavorites(pokemon: pokemon, completion: completion)
    }
}
