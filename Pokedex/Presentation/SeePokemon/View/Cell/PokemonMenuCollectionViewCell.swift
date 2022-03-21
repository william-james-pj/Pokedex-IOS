//
//  PokemonMenuCollectionViewCell.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 18/03/22.
//

import UIKit

class PokemonMenuCollectionViewCell: UICollectionViewCell {
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
    
    fileprivate let labelText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    func configCell(with itemText: String) {
        labelText.text = itemText
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(viewBase)
        viewBase.addSubview(labelText)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            viewBase.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            viewBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            viewBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            viewBase.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            labelText.centerXAnchor.constraint(equalTo: viewBase.centerXAnchor),
            labelText.centerYAnchor.constraint(equalTo: viewBase.centerYAnchor),
        ])
    }
}
