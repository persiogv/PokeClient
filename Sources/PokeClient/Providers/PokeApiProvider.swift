//
//  PokeApiProvider.swift
//  PokeClient
//
//  Created by Pérsio on 18/04/20.
//

import Foundation
import CoreNetworking
import Core

class PokeApiProvider: ApiProvider {
    
    // MARK: Constants
    
    private struct Constants {
        static let baseUrl = "https://pokeapi.co/api/v2"
        
        struct Files {
            static let infoPlist = "Info"
        }
        
        struct Paths {
            static let pokemon = "/pokemon"
        }
        
        struct Parameters {
            static let offset = "offset"
            static let limit = "limit"
        }
    }
    
    // MARK: Initializers
    
    override init(baseUrl: String = Constants.baseUrl, requester: HTTPRequester = Networker()) {
        let file = FileRepresentation(withFileName: Constants.Files.infoPlist, fileExtension: .plist, fileBundle: .main)
        
        if let info = try? file.decoded(to: InfoPlist.self, using: PropertyListDecoder()), let baseUrl = info.serverUrl {
            super.init(baseUrl: baseUrl, requester: requester)
            return
        }
        
        super.init(baseUrl: baseUrl, requester: requester)
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
