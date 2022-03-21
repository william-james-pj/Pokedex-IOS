//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 11/03/22.
//

import Foundation

class PokemonModel: Codable {
    let id: Int?
    let name: String?
    let sprites: SpritesModel?
    let weight: Int?
    let height: Int?
    let types: [PokemonTypeArrayModel]?
    let stats: [PokemonStatsModel]
}

class SpritesModel: Codable {
    let back_default: String?
    let back_female: String?
    let back_shiny: String?
    let back_shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

class PokemonTypeArrayModel: Codable {
    let slot: Int?
    let type: PokemonTypeModel
}

class PokemonTypeModel: Codable {
    let name: String?
    let url: String?
}

class PokemonStatsModel: Codable {
    let base_stat: Int
    let effort: Int
    let stat: PokemonStatModel
}

class PokemonStatModel: Codable {
    let name: String
}
