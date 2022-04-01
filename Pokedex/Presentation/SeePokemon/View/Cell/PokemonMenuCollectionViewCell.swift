//
//  PokemonMenuCollectionViewCell.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 18/03/22.
//

import UIKit

protocol PokemonMenuCollectionViewCellDelegate: AnyObject {
    func setActive(id: Int)
}

class PokemonMenuCollectionViewCell: UICollectionViewCell {
    // MARK: - Variables
    fileprivate var menuData: PageMenuModel?
    fileprivate var pokemonColor: UIColor?
    var delegate: PokemonMenuCollectionViewCellDelegate?
    
    // MARK: - Components
    fileprivate let viewBase: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.20
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 3
        
        view.layer.shadowPath = nil
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        
        return view
    }()
    
    fileprivate lazy var buttonText: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        return button
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
    func configCell(with menuItem: PageMenuModel, pokemonColor: UIColor) {
        buttonText.setTitle(menuItem.title, for: .normal)
        
        self.pokemonColor = pokemonColor
        self.menuData = menuItem
        
        setActive(isActive: menuItem.isActive)
    }
    
    fileprivate func setActive(isActive: Bool){
        if !isActive {
            buttonText.setTitleColor(.lightGray, for: .normal)
            return
        }
        
        guard let pokemonColor = pokemonColor else {
            return
        }

        buttonText.setTitleColor(pokemonColor, for: .normal)
    }
    
    @objc private func handleButtonTapped() {
        guard let delegate = delegate, let menuData = menuData else {
            return
        }

        delegate.setActive(id: menuData.id)
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(viewBase)
        viewBase.addSubview(buttonText)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            viewBase.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            viewBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            viewBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            viewBase.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            buttonText.topAnchor.constraint(equalTo: viewBase.topAnchor),
            buttonText.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor),
            buttonText.trailingAnchor.constraint(equalTo: viewBase.trailingAnchor),
            buttonText.bottomAnchor.constraint(equalTo: viewBase.bottomAnchor),
        ])
    }
}
