//
//  PokemonTypeCollectionViewCell.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 14/03/22.
//

import UIKit

enum PokemonTypeCellType {
    case small
    case normal
}

class PokemonTypeCollectionViewCell: UICollectionViewCell {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labeltype: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let imageViewType: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func configCell(pokemonType: String, cellType: PokemonTypeCellType) {
        guard let pokemonTypeCase = PokemonTypeEnun(rawValue: pokemonType) else {
            return
        }
        
        setCell(cellType)
        setByType(pokemonTypeCase)
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(imageViewType)
        stackBase.addArrangedSubview(labeltype)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            labeltype.widthAnchor.constraint(equalToConstant: 63),
        ])
    }
    
    fileprivate func setCell(_ cellType : PokemonTypeCellType) {
        switch cellType {
        case .small:
            self.layer.cornerRadius = 10
            labeltype.isHidden = true
        case .normal:
            self.layer.cornerRadius = 4
            labeltype.isHidden = false
        }
    }
    
    fileprivate func setByType(_ pokemonType: PokemonTypeEnun) {
        switch pokemonType {
        case .typeBug:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "BUG"
            self.backgroundColor = UIColor(named: "ColorBug")
        case .typeDark:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "DARK"
            self.backgroundColor = UIColor(named: "ColorDark")
        case .typeDragon:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "DRAGON"
            self.backgroundColor = UIColor(named: "ColorDragon")
        case .typeElectric:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "ELECTRIC"
            self.backgroundColor = UIColor(named: "ColorElectric")
        case .typeFairy:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "FAIRY"
            self.backgroundColor = UIColor(named: "ColorFairy")
        case .typeFighting:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "FIGHTING"
            self.backgroundColor = UIColor(named: "ColorFighting")
        case .typeFire:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "FIRE"
            self.backgroundColor = UIColor(named: "ColorFire")
        case .typeFlying:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "FLYING"
            self.backgroundColor = UIColor(named: "ColorFlying")
        case .typeGhost:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "GHOST"
            self.backgroundColor = UIColor(named: "ColorGhost")
        case .typeGrass:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "GRASS"
            self.backgroundColor = UIColor(named: "ColorGrass")
        case .typeGround:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "GROUND"
            self.backgroundColor = UIColor(named: "ColorGround")
        case .typeIce:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "ICE"
            self.backgroundColor = UIColor(named: "ColorIce")
        case .typeNormal:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "NORMAL"
            self.backgroundColor = UIColor(named: "ColorNormal")
        case .typePoison:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "POISON"
            self.backgroundColor = UIColor(named: "ColorPoison")
        case .typePsychic:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "PSYCHIC"
            self.backgroundColor = UIColor(named: "ColorPsychic")
        case .typeRock:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "ROCK"
            self.backgroundColor = UIColor(named: "ColorRock")
        case .typeSteel:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "STEEL"
            self.backgroundColor = UIColor(named: "ColorSteel")
        case .typeWater:
            imageViewType.image = UIImage(named: pokemonType.rawValue)
            labeltype.text = "WATER"
            self.backgroundColor = UIColor(named: "ColorWater")
        }
    }
}
