//
//  CarouselType.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 21/03/22.
//

import UIKit

class CarouselType: UIView {
    // MARK: - Constrants
    fileprivate let resuseIdentifierTypeHeader = "PokemonTypeCollectionViewCell"
    
    // MARK: - Variables
    fileprivate var pokemonData: PokemonModel?
    fileprivate var cellTypePokemon: PokemonTypeCellType = .small

    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let collectionViewPokemonType: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
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
        self.translatesAutoresizingMaskIntoConstraints = false
        
        buildHierarchy()
        buildConstraints()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewPokemonType.dataSource = self
        collectionViewPokemonType.delegate = self
        collectionViewPokemonType.register(PokemonTypeCollectionViewCell.self, forCellWithReuseIdentifier: resuseIdentifierTypeHeader)
    }
    
    // MARK: - Methods
    func configCell(_ pokemon: PokemonModel, cellType: PokemonTypeCellType) {
        self.pokemonData = pokemon
        self.cellTypePokemon = cellType
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(collectionViewPokemonType)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            collectionViewPokemonType.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

// MARK: - extension CollectionViewDelegate
extension CarouselType: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
}

// MARK: - extension CollectionViewDataSource
extension CarouselType: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pokemonData = pokemonData else {
            return 0
        }
        return pokemonData.types?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifierTypeHeader, for: indexPath) as! PokemonTypeCollectionViewCell
        cell.configCell(pokemonType: pokemonData?.types?[indexPath.row].type.name ?? "", cellType: cellTypePokemon)
        return cell
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension CarouselType: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if cellTypePokemon == .small {
            return CGSize(width: 22, height: 20)
        }
        return CGSize(width: 85, height: 20)
    }
}
