//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 11/03/22.
//

import Foundation

public class PokemonModel: Codable {
    public let id: Int
    public let name: String
    public let sprites: SpritesModel
    public let weight: Int
    public let height: Int
}

public class SpritesModel: Codable {
    public let back_default: String?
    public let back_female: String?
    public let back_shiny: String?
    public let back_shiny_female: String?
    public let front_default: String?
    public let front_female: String?
    public let front_shiny: String?
    public let front_shiny_female: String?
}
