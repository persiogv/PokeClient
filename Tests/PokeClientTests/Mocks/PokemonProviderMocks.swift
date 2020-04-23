import XCTest
@testable import PokeClient

class PokemonProviderSuccessMock: PokemonProvider {
    
    func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion) {
        let grass = Ability(name: "grass", url: "")
        let ability = PokemonAbility(ability: grass, isHidden: false, slot: 0)
        
        let version = Version(name: "red", url: "")
        let gameIndex = PokemonGameIndex(gameIndex: 0, version: version)
        
        let species = PokemonSpecies(name: "poison", url: "")
        
        let sprites = PokemonSprites(frontDefault: "")
        
        let speed = Stat(name: "speed", url: "")
        let stats = PokemonStat(baseStat: 0, effort: 1, stat: speed)
        
        let poison = Type(name: "poison", url: "")
        let type = PokemonType(slot: 0, type: poison)
        
        let details = PokemonDetails(abilities: [ability], gameIndices: [gameIndex], height: 100, name: pokemon.name, order: 1, species: species, sprites: sprites, stats: [stats], types: [type], weight: 120)
        
        completion(.success(details))
    }
    
    func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion) {
        let pikachu = Pokemon(name: "pikachu", url: nil)
        let bulbasaur = Pokemon(name: "bulbasaur", url: nil)
        
        completion(.success([pikachu, bulbasaur]))
    }
}

class PokemonProviderFailureMock: PokemonProvider {
    
    func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion) {
        completion(.failure(ErrorMock.some))
    }
    
    func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion) {
        completion(.failure(ErrorMock.some))
    }
}
