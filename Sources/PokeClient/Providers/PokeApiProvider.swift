//
//  PokeApiProvider.swift
//  PokeClient
//
//  Created by Pérsio on 18/04/20.
//

import Foundation
import CoreNetworking

class PokeApiProvider: ApiProvider {
    
    // MARK: Constants
    
    private struct Constants {
        static let baseUrl = "https://pokeapi.co/api/v2"
        
        struct Paths {
            static let pokemon = "/pokemon"
        }
        
        struct Parameters {
            static let offset = "offset"
            static let limit = "limit"
        }
    }
    
    // MARK: Initializers
    
    /// Initializer
    required init() {
        super.init(baseUrl: Constants.baseUrl)
    }
}

// MARK: - Pokemon provider
extension PokeApiProvider: PokemonProvider {
    
    func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion) {
        let offset = [Constants.Parameters.offset: String(offset)]
        let limit = [Constants.Parameters.limit: String(limit)]
        
        GET(path: Constants.Paths.pokemon, headers: [], parameters: [offset, limit]) { result in
            switch result {
            case .success(let data):
                guard let response = try? JSONDecoder().decode(PokemonResponse.self, from: data), let results = response.results else {
                    return completion(.failure(RequestError.invalidData))
                }
                
                completion(.success(results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion) {
        let paths = [Constants.Paths.pokemon, pokemon.name]
        
        GET(path: paths.joined(separator: "/"), headers: [], parameters: []) { result in
            switch result {
            case .success(let data):
                guard let details = try? JSONDecoder().decode(PokemonDetails.self, from: data) else {
                    return completion(.failure(RequestError.invalidData))
                }
                
                completion(.success(details))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
