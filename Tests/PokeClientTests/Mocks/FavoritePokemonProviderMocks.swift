import XCTest
import Core
@testable import PokeClient

final class FavoritePokemonSuccessMock: FavoritePokemonProvider {
    
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

final class FavoritePokemonFailureMock: FavoritePokemonProvider {
    
    func checkForFavorite(_ pokemon: Pokemon) -> Bool {
        return false
    }
    
    func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion) {
        completion(.failure(ErrorMock.some))
    }
    
    func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        completion(.failure(ErrorMock.some))
    }
    
    func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {
        completion(.failure(ErrorMock.some))
    }
}
