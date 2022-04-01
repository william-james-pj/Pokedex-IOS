//
//  PokemonImageCollectionViewCell.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 14/03/22.
//

import UIKit

class PokemonImageCollectionViewCell: UICollectionViewCell {
    // MARK: - Components
    fileprivate let imageViewPokemon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let viewBase: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    func configCell(urlImage: String) {
        do {
            guard let url = URL(string: urlImage) else { return }
            let data = try Data(contentsOf: url)
            imageViewPokemon.image = UIImage(data: data)
        } catch {
        }
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(viewBase)
        
        viewBase.addSubview(imageViewPokemon)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            viewBase.topAnchor.constraint(equalTo: self.topAnchor),
            viewBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageViewPokemon.centerYAnchor.constraint(equalTo: viewBase.centerYAnchor),
            imageViewPokemon.centerXAnchor.constraint(equalTo: viewBase.centerXAnchor),
            imageViewPokemon.heightAnchor.constraint(equalToConstant: 150),
            imageViewPokemon.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
