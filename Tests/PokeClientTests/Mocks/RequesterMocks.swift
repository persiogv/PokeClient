import XCTest
import CoreNetworking
@testable import PokeClient

class PokemonListSuccessRequesterMock: HTTPRequester {
    
    func request(url: URL, method: RequestMethod, session: URLSession, body: Data?, headers: [RequestHeader]?, completion: @escaping RequestCompletion) {
        let json = "{\"count\": 964,\"next\": \"https://pokeapi.co/api/v2/pokemon?offset=20&limit=20\",\"previous\": null,\"results\": [{\"name\": \"bulbasaur\", \"url\": \"https://pokeapi.co/api/v2/pokemon/1/\"},{\"name\": \"ivysaur\",\"url\": \"https://pokeapi.co/api/v2/pokemon/2/\"}]}"
        
        if let data = json.data(using: .utf8, allowLossyConversion: false) {
            return completion(.success(data))
        }
        
        completion(.failure(ErrorMock.some))
    }
    
    func upload(url: URL, method: RequestMethod, data: Data, session: URLSession, completion: @escaping RequestCompletion) {}
    
    func download(url: URL, session: URLSession, completion: @escaping RequestCompletion) {}
}

class PokemonDetailsSuccessRequesterMock: HTTPRequester {
    
    func request(url: URL, method: RequestMethod, session: URLSession, body: Data?, headers: [RequestHeader]?, completion: @escaping RequestCompletion) {
        let json = "{\"abilities\": [{\"ability\": {\"name\": \"chlorophyll\",\"url\": \"https://pokeapi.co/api/v2/ability/34/\"},\"is_hidden\": true,\"slot\": 3},{\"ability\": {\"name\": \"overgrow\",\"url\": \"https://pokeapi.co/api/v2/ability/65/\"},\"is_hidden\": false,\"slot\": 1}],\"base_experience\": 64,\"forms\": [{\"name\": \"bulbasaur\",\"url\": \"https://pokeapi.co/api/v2/pokemon-form/1/\"}],\"game_indices\": [{\"game_index\": 1,\"version\": {\"name\": \"white-2\",\"url\": \"https://pokeapi.co/api/v2/version/22/\"}},{\"game_index\": 1,\"version\": {\"name\": \"black-2\",\"url\": \"https://pokeapi.co/api/v2/version/21/\"} }],\"height\": 7,\"held_items\": [],\"id\": 1,\"is_default\": true,\"location_area_encounters\": \"https://pokeapi.co/api/v2/pokemon/1/encounters\",\"moves\": [{\"move\": {\"name\": \"razor-wind\",\"url\": \"https://pokeapi.co/api/v2/move/13/\"},\"version_group_details\": [{\"level_learned_at\": 0,\"move_learn_method\": {\"name\": \"egg\",\"url\": \"https://pokeapi.co/api/v2/move-learn-method/2/\"},\"version_group\": {\"name\": \"crystal\",\"url\": \"https://pokeapi.co/api/v2/version-group/4/\"}},{\"level_learned_at\": 0,\"move_learn_method\": {\"name\": \"egg\",\"url\": \"https://pokeapi.co/api/v2/move-learn-method/2/\"},\"version_group\": {\"name\": \"gold-silver\",\"url\": \"https://pokeapi.co/api/v2/version-group/3/\"}}]}],\"name\": \"bulbasaur\",\"order\": 1,\"species\": {\"name\": \"bulbasaur\",\"url\": \"https://pokeapi.co/api/v2/pokemon-species/1/\"},\"sprites\": {\"back_default\": \"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png\",\"back_female\": null,\"back_shiny\": \"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png\",\"back_shiny_female\": null,\"front_default\": \"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png\",\"front_female\": null,\"front_shiny\": \"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png\",\"front_shiny_female\": null},\"stats\": [{\"base_stat\": 45,\"effort\": 0,\"stat\": {\"name\": \"speed\",\"url\": \"https://pokeapi.co/api/v2/stat/6/\"}},{\"base_stat\": 65,\"effort\": 0,\"stat\": {\"name\": \"special-defense\",\"url\": \"https://pokeapi.co/api/v2/stat/5/\"}},{\"base_stat\": 65,\"effort\": 1,\"stat\": {\"name\": \"special-attack\",\"url\": \"https://pokeapi.co/api/v2/stat/4/\"}},{\"base_stat\": 49,\"effort\": 0,\"stat\": {\"name\": \"defense\",\"url\": \"https://pokeapi.co/api/v2/stat/3/\"}},{\"base_stat\": 49,\"effort\": 0,\"stat\": {\"name\": \"attack\",\"url\": \"https://pokeapi.co/api/v2/stat/2/\"}},{\"base_stat\": 45,\"effort\": 0,\"stat\": {\"name\": \"hp\",\"url\": \"https://pokeapi.co/api/v2/stat/1/\"}}],\"types\": [{\"slot\": 2,\"type\": {\"name\": \"poison\",\"url\": \"https://pokeapi.co/api/v2/type/4/\"}},{\"slot\": 1,\"type\": {\"name\": \"grass\",\"url\": \"https://pokeapi.co/api/v2/type/12/\"}}],\"weight\": 69}"
        
        if let data = json.data(using: .utf8, allowLossyConversion: false) {
            return completion(.success(data))
        }
        
        completion(.failure(ErrorMock.some))
    }
    
    func upload(url: URL, method: RequestMethod, data: Data, session: URLSession, completion: @escaping RequestCompletion) {}
    
    func download(url: URL, session: URLSession, completion: @escaping RequestCompletion) {}
}

class PokemonListFailureRequesterMock: HTTPRequester {
    
    func request(url: URL, method: RequestMethod, session: URLSession, body: Data?, headers: [RequestHeader]?, completion: @escaping RequestCompletion) {
        completion(.failure(ErrorMock.some))
    }
    
    func upload(url: URL, method: RequestMethod, data: Data, session: URLSession, completion: @escaping RequestCompletion) {}
    
    func download(url: URL, session: URLSession, completion: @escaping RequestCompletion) {}
}

class PokemonDetailsFailureRequesterMock: HTTPRequester {
    
    func request(url: URL, method: RequestMethod, session: URLSession, body: Data?, headers: [RequestHeader]?, completion: @escaping RequestCompletion) {
        completion(.failure(ErrorMock.some))
    }
    
    func upload(url: URL, method: RequestMethod, data: Data, session: URLSession, completion: @escaping RequestCompletion) {}
    
    func download(url: URL, session: URLSession, completion: @escaping RequestCompletion) {}
}
