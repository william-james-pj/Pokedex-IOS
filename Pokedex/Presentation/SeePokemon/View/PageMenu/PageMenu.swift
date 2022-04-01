//
//  PageMenu.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 18/03/22.
//

import UIKit

enum ViewsMenu {
    case about
    case stats
}

struct PageMenuModel {
    let id: Int
    let title: String
    var isActive: Bool
}

class PageMenu: UIView {
    // MARK: - Constrants
    fileprivate let resuseIdentifierMenu = "PokemonMenuCollectionViewCell"
    
    // MARK: - Variables
    fileprivate var pokemonData: PokemonModel?
    fileprivate var pokemonColor: UIColor?
    fileprivate var aboutPokemon = AboutPokemon()
    fileprivate var statsPokemon = StatsPokemon()
    fileprivate var menuItems: [PageMenuModel] = [PageMenuModel(id: 0, title: "About", isActive: true), PageMenuModel(id: 1, title: "Stats", isActive: false)]
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackAux: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let collectionViewMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        
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
        
        aboutPokemon.isHidden = false
        statsPokemon.isHidden = true
        
        buildHierarchy()
        buildConstraints()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewMenu.dataSource = self
        collectionViewMenu.delegate = self
        collectionViewMenu.register(PokemonMenuCollectionViewCell.self, forCellWithReuseIdentifier: resuseIdentifierMenu)
    }
    
    // MARK: - Methods
    func configCell(_ pokemon: PokemonModel, pokemonColor: UIColor) {
        self.pokemonData = pokemon
        self.pokemonColor = pokemonColor
        
        let aboutPokemonType = AboutPokemonType(
            pokemon: pokemon,
            attributes: [
                AboutDataType(attribute: "Height", value: "\((pokemon.height ?? 0) * 10) cm"),
                AboutDataType(attribute: "Weight", value: "\(String(format: "%.1f", (Double(pokemon.weight ?? 0)) / 4.536)) lbs (\(String(format: "%.1f", (Double(pokemon.weight ?? 0)) / 10.0)) kg)"),
            ])
        
        aboutPokemon.configCell(pokemonColor: pokemonColor, pokemonData: aboutPokemonType)
        statsPokemon.configCell(pokemonColor: pokemonColor, pokemonData: pokemon)
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(collectionViewMenu)
        stackBase.addArrangedSubview(aboutPokemon)
        stackBase.addArrangedSubview(statsPokemon)
        stackBase.addArrangedSubview(viewStackAux)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            collectionViewMenu.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func showView(viewMenu: ViewsMenu) {
        hiddenView()
        switch viewMenu {
        case .about:
            aboutPokemon.isHidden = false
        case .stats:
            statsPokemon.isHidden = false
        }
    }
    
    private func hiddenView() {
        aboutPokemon.isHidden = true
        statsPokemon.isHidden = true
    }
    
}
// MARK: - extension PokemonMenuCollectionViewCellDelegate
extension PageMenu: PokemonMenuCollectionViewCellDelegate {
    func setActive(id: Int) {
        switch id {
        case 0:
            showView(viewMenu: .about)
        case 1:
            showView(viewMenu: .stats)
        default:
            return
        }
        
        menuItems[0].isActive = !menuItems[0].isActive
        menuItems[1].isActive = !menuItems[1].isActive
        collectionViewMenu.reloadData()
    }
}

// MARK: - extension CollectionViewDelegate
extension PageMenu: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
}

// MARK: - extension CollectionViewDataSource
extension PageMenu: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifierMenu, for: indexPath) as! PokemonMenuCollectionViewCell
        if let pokemonColor = pokemonColor {
            cell.configCell(with: menuItems[indexPath.row], pokemonColor: pokemonColor)
        }
        cell.delegate = self
        return cell
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension PageMenu: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: (width / 2) - 20, height: 40)
    }
}
