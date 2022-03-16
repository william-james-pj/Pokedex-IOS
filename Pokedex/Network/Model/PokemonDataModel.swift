//
//  PokemonData.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 11/03/22.
//

import Foundation

class PokedexDataModel: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [PokemonEntryModel]
}

class PokemonEntryModel: Codable {
    let name: String?
    let url: String?
}
