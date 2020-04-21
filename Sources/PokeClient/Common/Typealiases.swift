//
//  Typealiases.swift
//  PokeClient
//
//  Created by Pérsio on 19/04/20.
//

import Foundation

// MARK: - Closures

/// Pokemon favorite completion typealias
public typealias PokemonFavoriteCompletion = (Result<Pokemon, Error>) -> Void

/// Pokemon list completion typealias
public typealias PokemonListCompletion = (Result<[Pokemon], Error>) -> Void

/// Pokemon details completion typealias
public typealias PokemonDetailsCompletion = (Result<PokemonDetails, Error>) -> Void

// MARK: - Types

/// PokemonListProvider & PokemonDetailsProvider typealias
public typealias PokemonProvider = PokemonListProvider & PokemonDetailsProvider

/// Pokemon typealias
public typealias Pokemon = NamedAPIResource

/// Ability typealias
public typealias Ability = NamedAPIResource

/// Version typealias
public typealias Version = NamedAPIResource

/// PokemonSpecies typealias
public typealias PokemonSpecies = NamedAPIResource

/// Stat typealias
public typealias Stat = NamedAPIResource

/// Type typealias
public typealias Type = NamedAPIResource
