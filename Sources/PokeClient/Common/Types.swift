//
//  Types.swift
//  PokeClient
//
//  Created by Pérsio on 18/04/20.
//

import Foundation

/// Named API Resource model
public struct NamedAPIResource: Codable {
    
    // MARK: Properties
    
    public let name: String
    public let url: String?
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - name: Resource's name
    ///   - url: Resource's url
    public init(name: String, url: String?) {
        self.name = name
        self.url = url
    }
}

