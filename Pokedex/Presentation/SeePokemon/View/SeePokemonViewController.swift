//
//  SeePokemonViewController.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 13/03/22.
//

import UIKit

class SeePokemonViewController: UIViewController {
    // MARK: - Constrants
    fileprivate let resuseIdentifier = "PokemonImageCollectionViewCell"
    
    // MARK: - variables
    fileprivate var pageMenu = PageMenu()
    fileprivate var carouselType = CarouselType()
    fileprivate var pokemonData: PokemonModel?
    fileprivate var pokemonColor: UIColor?
    fileprivate var pokemonImage: [String] = []
    fileprivate var getPokemonColor: GetPokemonColor = { return GetColorByType()}()

    // MARK: - Components
    fileprivate let viewColor: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewShadow: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    fileprivate let labelNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 26)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let collectionViewPokemonImage: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    fileprivate let pageControlPokemon: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        return pageControl
    }()
    
    fileprivate func stackTextHeader() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelNumber)
        stack.addArrangedSubview(labelTitle)
        return stack
    }
    
    fileprivate func stackCaroselHeader() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(collectionViewPokemonImage)
        stack.addArrangedSubview(pageControlPokemon)
        return stack
    }
    
    fileprivate func stackHeader() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(stackTextHeader())
        stack.addArrangedSubview(carouselType)
        stack.addArrangedSubview(stackCaroselHeader())
        return stack
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        view.backgroundColor = .white
        
        buildHierarchy()
        buildConstraints()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewPokemonImage.dataSource = self
        collectionViewPokemonImage.delegate = self
        collectionViewPokemonImage.register(PokemonImageCollectionViewCell.self, forCellWithReuseIdentifier: resuseIdentifier)
    }
    
    // MARK: - Methods
    func configCell(_ pokemon: PokemonModel) {
        self.labelNumber.text = String(format: "#%03d", pokemon.id ?? 0)
        self.labelTitle.text = pokemon.name?.capitalized
        self.pokemonData = pokemon
        
        setImageArray()
        
        self.pokemonColor = getPokemonColor.getColorByType(pokemonType: pokemon.types?[0].type.name ?? "")
        
        guard let pokemonColor = pokemonColor else {
            return
        }
        
        viewColor.backgroundColor = pokemonColor
        pageMenu.configCell(pokemon, pokemonColor: pokemonColor)
        carouselType.configCell(pokemon, cellType: .small)
    }
    
    fileprivate func setImageArray() {
        guard let sprites = self.pokemonData?.sprites else {
            return
        }
        
        if let front_default = sprites.front_default {
            self.pokemonImage.append(front_default)
        }
        
        if let back_default = sprites.back_default {
            self.pokemonImage.append(back_default)
        }
        
//        if let front_female = sprites.front_female {
//            self.pokemonImage.append(front_female)
//        }
//
//        if let back_female = sprites.back_female {
//            self.pokemonImage.append(back_female)
//        }
        
        pageControlPokemon.numberOfPages = self.pokemonImage.count
    }
    
    fileprivate func buildHierarchy() {
        view.addSubview(viewColor)
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(stackHeader())
        stackBase.addArrangedSubview(pageMenu)
        stackBase.addArrangedSubview(viewStackAux)
        
        viewColor.addSubview(viewShadow)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            viewColor.topAnchor.constraint(equalTo: view.topAnchor),
            viewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewColor.heightAnchor.constraint(equalToConstant: 360),
            
            viewShadow.topAnchor.constraint(equalTo: viewColor.topAnchor),
            viewShadow.leadingAnchor.constraint(equalTo: viewColor.leadingAnchor),
            viewShadow.trailingAnchor.constraint(equalTo: viewColor.trailingAnchor),
            viewShadow.bottomAnchor.constraint(equalTo: viewColor.bottomAnchor),
            
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionViewPokemonImage.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
}

// MARK: - extension CollectionViewDelegate
extension SeePokemonViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / collectionViewPokemonImage.frame.width
        pageControlPokemon.currentPage = Int(scrollPos)
    }
}

// MARK: - extension CollectionViewDataSource
extension SeePokemonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as! PokemonImageCollectionViewCell
        cell.configCell(urlImage: pokemonImage[indexPath.row])
        return cell
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension SeePokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 150)
    }
}
