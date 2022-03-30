//
//  HeaderCollectionReusableView.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 29/03/22.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let labelText: UILabel = {
        let label = UILabel()
        label.text = "Search for a Pokémon by name or using its"
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelSubText: UILabel = {
        let label = UILabel()
        label.text = "National Pokédex number"
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let textFieldSearch: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name or number"
        textField.backgroundColor = UIColor(red: 0.91, green: 0.95, blue: 0.95, alpha: 1)
        textField.layer.cornerRadius = 8.0
        textField.setLeftPaddingPoints(15)
        textField.setRightPaddingPoints(15)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    fileprivate let buttonSearch: UIButton  = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.32, green: 0.33, blue: 0.44, alpha: 1)
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8.0
        return button
    }()
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Pokédex"
        label.font = UIFont(name: "OpenSans-Bold", size: 26)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate func stackHeader() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelTitle)
        stack.addArrangedSubview(stackTitle())
        return stack
    }
    
    fileprivate func stackTitle() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelText)
        stack.addArrangedSubview(labelSubText)
        return stack
    }

    fileprivate func stackSearch() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(textFieldSearch)
        stack.addArrangedSubview(buttonSearch)
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
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods

    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(stackHeader())
        stackBase.addArrangedSubview(stackSearch())
        stackBase.addArrangedSubview(viewAux)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            textFieldSearch.heightAnchor.constraint(equalToConstant: 50),
            buttonSearch.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}
