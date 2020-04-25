# PokeClient

A very simple **Swift Package** to consume PokéAPI.

## Advice

This is a work in progress project. New features are being added. Contributions are welcome!

## Getting started

1. Add package to your project (Xcode > File > Swift Packages > Add Package Dependency...). Point to branch `master`.
2. Search for the following url: https://github.com/persiogv/PokeClient
3. Add `import PokeClient` in your Swift file

## Favorites

As PokéAPI doesn't have endpoints to handle favorited pokemons, this is just a fake feature, caching the favorites only in the memory.

## Usage

#### Fetching pokemons:

```swift
  /// Fetches pokemon list
  /// - Parameters:
  ///   - offset: Pokemon list offset
  ///   - limit: Pokemon list limit
  ///   - completion: Completiion handler
  public func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion)
```

#### Fetching pokemon details:

```swift
  /// Fetches the details for the given Pokemon
  /// - Parameters:
  ///   - name: Pokemon's name
  ///   - completion: Completion handler
  public func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion)
```

#### Checking if a given pokemon is a favorite pokemon:

```swift
  /// Checks if the given pokemon is favorite
  /// - Parameter pokemon: The pokemon to check
  public func checkForFavorite(_ pokemon: Pokemon) -> Bool
```

#### Fetching favorited pokemons:

```swift
  /// Fetches the user's favorited pokemons
  /// - Parameter completion: Completion handler
  public func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion)
```

#### Adding a pokemon to favorites:

```swift
  /// Favorites the given pokemon
  /// - Parameters:
  ///   - pokemon: The pokemon to be favorited
  ///   - completion: Completion handler
  public func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion)
```

#### Removing a given pokemon from favorites:

```swift
  /// Removes the given pokemon from favorites
  /// - Parameters:
  ///   - pokemon: The pokemon to be removed
  ///   - completion: Completion handler
  public func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion)
```

## License

The MIT License (MIT)

Copyright (c) 2020 Persio Vieira

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
