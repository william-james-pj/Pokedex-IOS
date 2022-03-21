//
//  AboutPokemon.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 18/03/22.
//

import UIKit

struct AboutPokemonType {
    let pokemon: PokemonModel
    let attributes: [AboutDataType]
}

class AboutPokemon: UIView {
    // MARK: - Constrants
    fileprivate let resuseIdentifier = "AboutDataCollectionViewCell"
    
    // MARK: - Variables
    fileprivate var carouselType = CarouselType()
    fileprivate var pokemonData: AboutPokemonType?
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Pokédex data"
        label.font = UIFont(name: "OpenSans-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let collectionViewData: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    fileprivate func stackCollection() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelTitle)
        stack.addArrangedSubview(collectionViewData)
        return stack
    }

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
        setupTable()
    }
    
    fileprivate func setupTable() {
        collectionViewData.dataSource = self
        collectionViewData.delegate = self
        collectionViewData.register(AboutDataCollectionViewCell.self, forCellWithReuseIdentifier: resuseIdentifier)
    }
    
    // MARK: - Methods
    func configCell(pokemonColor: UIColor, pokemonData: AboutPokemonType) {
        labelTitle.textColor = pokemonColor
        
        self.pokemonData = pokemonData
        carouselType.configCell(pokemonData.pokemon, cellType: .normal)
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(carouselType)
        stackBase.addArrangedSubview(stackCollection())
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

// MARK: - extension CollectionViewDelegate
extension AboutPokemon: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
}

// MARK: - extension CollectionViewDataSource
extension AboutPokemon: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let pokemonData = pokemonData else {
            return 0
        }
        
        return pokemonData.attributes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as! AboutDataCollectionViewCell
        
        if let pokemonData = pokemonData {
            cell.configCell(aboutData: pokemonData.attributes[indexPath.row])
        }
        
        return cell
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension AboutPokemon: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 35)
    }
}

