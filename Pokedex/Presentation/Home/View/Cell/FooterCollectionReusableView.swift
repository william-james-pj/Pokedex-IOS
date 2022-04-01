//
//  FooterCollectionReusableView.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 29/03/22.
//

import UIKit

protocol FooterCollectionReusableViewDelegate {
    func buttonFooterPressed()
}

class FooterCollectionReusableView: UICollectionReusableView {
    // MARK: - Variables
    var delegate: FooterCollectionReusableViewDelegate?
    
    // MARK: - Components
    fileprivate let viewBase: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var buttonText: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.91, green: 0.95, blue: 0.95, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Load more pokemons", for: .normal)
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
    @objc private func handleButtonTapped() {
        guard let delegate = delegate else {
            return
        }

        delegate.buttonFooterPressed()
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(viewBase)
        viewBase.addSubview(buttonText)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            viewBase.topAnchor.constraint(equalTo: self.topAnchor),
            viewBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            buttonText.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor),
            buttonText.trailingAnchor.constraint(equalTo: viewBase.trailingAnchor),
            buttonText.centerYAnchor.constraint(equalTo: viewBase.centerYAnchor),
            
            buttonText.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
