//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 11/03/22.
//

import Foundation

protocol PokemonManagerDelegate {
    func didUpdatePokemon(_ pokedexManager: PokemonManager, pokemon: PokemonModel)
    func didFailWithError(error: Error)
}

class PokemonManager {
    fileprivate let pokedexURL = "https://pokeapi.co"
    
    var delegate: PokemonManagerDelegate?
    
    func fetchPokemon(id: String) {
        let urlString = "\(pokedexURL)/api/v2/pokemon/\(id)/"
        performRequest(with: urlString)
    }
    
    fileprivate func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let pokemon = self.parseJSON(safeData) {
                        self.delegate?.didUpdatePokemon(self, pokemon: pokemon)
                    }
                }
            }
            task.resume()
        }
    }
    
    fileprivate func parseJSON(_ pokemonData: Data) -> PokemonModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PokemonModel.self, from: pokemonData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
