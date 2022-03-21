//
//  PokedexManager.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 11/03/22.
//

import Foundation

protocol PokedexManagerDelegate {
    func didUpdatePokedex(_ pokedexManager: PokedexManager, pokedex: PokedexDataModel)
    func didFailWithError(error: Error)
}

class PokedexManager {
    fileprivate let pokedexURL = "https://pokeapi.co"
    
    var delegate: PokedexManagerDelegate?
    
    func fetchPokedex() {
        let urlString = "\(pokedexURL)/api/v2/pokemon?limit=3&offset=0/"
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
                    if let pokedex = self.parseJSON(safeData) {
                        self.delegate?.didUpdatePokedex(self, pokedex: pokedex)
                    }
                }
            }
            task.resume()
        }
    }
    
    fileprivate func parseJSON(_ pokedexData: Data) -> PokedexDataModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PokedexDataModel.self, from: pokedexData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
