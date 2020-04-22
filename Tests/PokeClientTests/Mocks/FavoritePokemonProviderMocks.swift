import XCTest
import Core
@testable import PokeClient

class FavoritePokemonSuccessMock: FavoritePokemonProvider {
    
    func checkForFavorite(_ pokemon: Pokemon) -> Bool {
        return true
    }
    
    func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion) {
        let pikachu = Pokemon(name: "pikachu", url: nil)
        completion(.success([pikachu]))
    }
    
    func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        completion(.success(pokemon))
    }
    
    func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        completion(.success(pokemon))
    }
}
