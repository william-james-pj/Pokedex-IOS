//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 11/03/22.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewBall: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        view.layer.cornerRadius = 60
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewPokemon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let labelName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelNumber: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let viewAuxTextTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewAuxTextBottom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate func stackText() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.addArrangedSubview(viewAuxTextTop)
        stack.addArrangedSubview(labelName)
        stack.addArrangedSubview(labelNumber)
        stack.addArrangedSubview(viewAuxTextBottom)
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
        self.backgroundColor = UIColor(red: 0.74, green: 0.88, blue: 0.81, alpha: 1)
        self.layer.cornerRadius = 10
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func configCell(pokemon: PokemonModel) {
        labelName.text = pokemon.name
        labelNumber.text = "\(pokemon.id)"
        
        do {
            guard let front_default = pokemon.sprites.front_default else {
                return
            }
            guard let url = URL(string: front_default) else { return }
            let data = try Data(contentsOf: url)
            imageViewPokemon.image = UIImage(data: data)
        } catch {
        }
        
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(viewImage)
        stackBase.addArrangedSubview(stackText())
        
        viewImage.addSubview(viewBall)
        viewImage.addSubview(imageViewPokemon)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            viewBall.heightAnchor.constraint(equalToConstant: 120),
            viewBall.widthAnchor.constraint(equalToConstant: 120),
            viewBall.centerXAnchor.constraint(equalTo: viewImage.centerXAnchor, constant: 5),
            viewBall.centerYAnchor.constraint(equalTo: viewImage.centerYAnchor, constant: 10),
            
            imageViewPokemon.topAnchor.constraint(equalTo: viewImage.topAnchor),
            imageViewPokemon.leadingAnchor.constraint(equalTo: viewImage.leadingAnchor),
            imageViewPokemon.trailingAnchor.constraint(equalTo: viewImage.trailingAnchor),
            imageViewPokemon.bottomAnchor.constraint(equalTo: viewImage.bottomAnchor),
            
            viewImage.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
}
