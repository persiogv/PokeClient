import XCTest
@testable import PokeClient

class PokemonProviderSuccessMock: PokemonProvider {
    
    func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion) {
        let details = PokemonDetails(abilities: nil, gameIndices: nil, height: 100, name: pokemon.name, order: 1, species: nil, sprites: nil, stats: nil, types: nil, weight: 120)
        
        completion(.success(details))
    }
    
    func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion) {
        let pikachu = Pokemon(name: "pikachu", url: nil)
        let bulbasaur = Pokemon(name: "bulbasaur", url: nil)
        
        completion(.success([pikachu, bulbasaur]))
    }
}
