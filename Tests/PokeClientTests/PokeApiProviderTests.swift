import XCTest
@testable import PokeClient

final class PokeApiProviderTests: XCTestCase {
    
    // MARK: Success
    
    func testFetchingPokemonListWithSuccess() {
        let expectation = XCTestExpectation()
        
        let provider = PokeApiProvider(requester: PokemonListSuccessRequesterMock())
        
        provider.fetchPokemonList(offset: 0, limit: 0) { result in
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
        
        let provider = PokeApiProvider(requester: PokemonDetailsSuccessRequesterMock())
        
        let pokemon = Pokemon(name: "", url: nil)
        provider.fetchPokemonDetails(pokemon: pokemon) { result in
            switch result {
            case .success(let details):
                XCTAssertEqual(details.name, "bulbasaur")
                XCTAssertEqual(details.weight, 69)
                XCTAssertEqual(details.height, 7)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    // MARK: Failure
    
    func testFetchingPokemonListWithFailure() {
        let expectation = XCTestExpectation()
        
        let provider = PokeApiProvider(requester: PokemonListFailureRequesterMock())
        
        provider.fetchPokemonList(offset: 0, limit: 0) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error as? ErrorMock, ErrorMock.some)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testFetchingPokemonDetailsWithFailure() {
        let expectation = XCTestExpectation()
        
        let provider = PokeApiProvider(requester: PokemonDetailsFailureRequesterMock())
        
        let pokemon = Pokemon(name: "", url: nil)
        provider.fetchPokemonDetails(pokemon: pokemon) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error as? ErrorMock, ErrorMock.some)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
