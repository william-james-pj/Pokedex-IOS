//
//  GetColorByType.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 15/03/22.
//

import UIKit

protocol GetPokemonColor {
    func getColorByType(pokemonType: String) -> UIColor
}

class GetColorByType: GetPokemonColor {
    func getColorByType(pokemonType: String) -> UIColor {
        let colorDefault = UIColor(red: 0.74, green: 0.88, blue: 0.81, alpha: 1)
        var colorReturn: UIColor?
        
        guard let pokemonTypeCase = PokemonTypeEnun(rawValue: pokemonType) else {
            return colorDefault
        }
        
        switch pokemonTypeCase {
        case .typeBug:
            colorReturn = UIColor(named: "ColorBug")
        case .typeDark:
            colorReturn = UIColor(named: "ColorDark")
        case .typeDragon:
            colorReturn = UIColor(named: "ColorDragon")
        case .typeElectric:
            colorReturn = UIColor(named: "ColorElectric")
        case .typeFairy:
            colorReturn = UIColor(named: "ColorFairy")
        case .typeFighting:
            colorReturn = UIColor(named: "ColorFighting")
        case .typeFire:
            colorReturn = UIColor(named: "ColorFire")
        case .typeFlying:
            colorReturn = UIColor(named: "ColorFlying")
        case .typeGhost:
            colorReturn = UIColor(named: "ColorGhost")
        case .typeGrass:
            colorReturn = UIColor(named: "ColorGrass")
        case .typeGround:
            colorReturn = UIColor(named: "ColorGround")
        case .typeIce:
            colorReturn = UIColor(named: "ColorIce")
        case .typeNormal:
            colorReturn = UIColor(named: "ColorNormal")
        case .typePoison:
            colorReturn = UIColor(named: "ColorPoison")
        case .typePsychic:
            colorReturn = UIColor(named: "ColorPsychic")
        case .typeRock:
            colorReturn = UIColor(named: "ColorRock")
        case .typeSteel:
            colorReturn = UIColor(named: "ColorSteel")
        case .typeWater:
            colorReturn = UIColor(named: "ColorWater")
        }
        
        guard let colorReturn = colorReturn else {
            return colorDefault
        }
        
        return colorReturn
    }
}
