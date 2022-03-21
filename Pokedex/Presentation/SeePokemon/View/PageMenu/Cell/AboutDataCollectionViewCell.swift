//
//  AboutDataCollectionViewCell.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 18/03/22.
//

import UIKit

struct AboutDataType {
    let attribute: String
    let value: String
}

class AboutDataCollectionViewCell: UICollectionViewCell {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    fileprivate let labelAttribute: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 16)
        label.textColor = .black
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
    func configCell(aboutData: AboutDataType) {
        labelAttribute.text = aboutData.attribute
        labelValue.text = aboutData.value
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(labelAttribute)
        stackBase.addArrangedSubview(labelValue)
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
