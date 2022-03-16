//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 11/03/22.
//

import Foundation

protocol HomeViewModelDelegate {
    func collectionDataReload()
}

class HomeViewModel {
    fileprivate var pokedexManager = PokedexManager()
    fileprivate var pokemonManager = PokemonManager()
    var pokemonsData: [PokemonModel] = []
    var delegate: HomeViewModelDelegate?
    
    init() {
        pokedexManager.delegate = self
        pokemonManager.delegate = self
        
        pokedexManager.fetchPokedex()
    }
    
    fileprivate func loadPokemon(_ pokemons: [PokemonEntryModel]) {
        pokemons.forEach { pokemon in
            guard let url = pokemon.url else {
                return
            }
            
            let newUrl = url.components(separatedBy: "/")
            let leght = newUrl.count
            pokemonManager.fetchPokemon(id: newUrl[leght - 2])
        }
    }
    
}

extension HomeViewModel: PokedexManagerDelegate {
    func didUpdatePokedex(_ pokedexManager: PokedexManager, pokedex: PokedexDataModel) {
        DispatchQueue.main.async {
            self.loadPokemon(pokedex.results)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension HomeViewModel: PokemonManagerDelegate {
    func didUpdatePokemon(_ pokedexManager: PokemonManager, pokemon: PokemonModel) {
        DispatchQueue.main.async {
            self.pokemonsData.append(pokemon)
            self.pokemonsData = self.pokemonsData.sorted(by: { $0.id ?? 1 < $1.id ?? 0})
            self.delegate?.collectionDataReload()
        }
    }
}
