//
//  WebhookProvider.swift
//  PokeClient
//
//  Created by Pérsio on 20/04/20.
//

import Foundation
import CoreNetworking
import Core

class WebhookProvider: ApiProvider {
    
    // MARK: Constants
    
    private struct Constants {
        static let baseUrl = "https://webhook.site"
        
        struct Paths {
            static let favorite = "/d295e018-137c-4c58-a019-fdd4cd344466"
        }
    }
    
    // MARK: Initializers
    
    /// Initializer
    required init() {
        super.init(baseUrl: Constants.baseUrl)
    }
}

// MARK: - Favorite pokemon provider
extension WebhookProvider: FavoritePokemonProvider {
    
    func checkForFavorite(_ pokemon: Pokemon) -> Bool {
        if let _ = Cacher.ephemeral.fetchValue(ofType: Pokemon.self, fromKey: pokemon.name) {
            return true
        }
        
        return false
    }
    
    func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion) {
        POST(path: Constants.Paths.favorite, body: nil, headers: []) { result in
            switch result {
            case .success:
                completion(.success(Cacher.ephemeral.fetchAllValues(ofType: Pokemon.self)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        POST(path: Constants.Paths.favorite, body: Data(pokemon.name.utf8), headers: []) { result in
            switch result {
            case .success:
                _ = Cacher.ephemeral.cacheValue(pokemon, toKey: pokemon.name)
                completion(.success(pokemon))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        POST(path: Constants.Paths.favorite, body: Data(pokemon.name.utf8), headers: []) { result in
            switch result {
            case .success:
                Cacher.ephemeral.uncacheValue(ofKey: pokemon.name)
                completion(.success(pokemon))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
