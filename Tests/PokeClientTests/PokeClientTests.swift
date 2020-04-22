import XCTest
@testable import PokeClient

final class PokeClientTests: XCTestCase {
    
    func testFetchingPokemonsWithSuccess() {
        let expectation = XCTestExpectation()
        
        let client = PokeClient(pokemonProvider: PokemonProviderSuccessMock(), favoriteProvider: FavoritePokemonSuccessMock())
        
        client.fetchPokemonList(offset: 0, limit: 0) { result in
            switch result {
            case .success(let pokemons):
                XCTAssertEqual(pokemons.count, 2)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testFetchingPokemonDetailsWithSuccess() {
        let expectation = XCTestExpectation()
        
        let client = PokeClient(pokemonProvider: PokemonProviderSuccessMock(), favoriteProvider: FavoritePokemonSuccessMock())
        
        let pikachu = Pokemon(name: "pikachu", url: nil)
        client.fetchPokemonDetails(pokemon: pikachu) { result in
            switch result {
            case .success(let details):
                XCTAssertEqual(details.name, "pikachu")
                XCTAssertEqual(details.height, 100)
                XCTAssertEqual(details.weight, 120)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}

