//
//  StatsDataCollectionViewCell.swift
//  Pokedex
//
//  Created by Pinto Junior, William James on 21/03/22.
//

import UIKit

class StatsDataCollectionViewCell: UICollectionViewCell {
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
    fileprivate let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = UIColor(red: 0.871, green: 0.832, blue: 0.836, alpha: 1)
        progressView.transform = CGAffineTransform(scaleX: 1, y: 0.3)
        progressView.layer.cornerRadius = 8
        progressView.clipsToBounds = true
        return progressView
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
    func configCell(pokemonColor: UIColor, statData: PokemonStatsModel) {
        setTextAttrubute(statData.stat.name)
        self.labelValue.text = "\(statData.base_stat)"
        
        progressBar.tintColor = pokemonColor
        progressBar.setProgress(Float(statData.base_stat) / Float(255), animated: true)
    }
    
    fileprivate func setTextAttrubute(_ statName: String) {
        switch statName {
        case "hp":
            self.labelAttribute.text = "HP"
        case "attack":
            self.labelAttribute.text = "ATK"
        case "defense":
            self.labelAttribute.text = "DEF"
        case "special-attack":
            self.labelAttribute.text = "SATK"
        case "special-defense":
            self.labelAttribute.text = "SDEF"
        case "speed":
            self.labelAttribute.text = "SPD"
        default:
            self.labelAttribute.text = "ERROR"
        }
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(labelAttribute)
        stackBase.addArrangedSubview(labelValue)
        stackBase.addArrangedSubview(progressBar)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            labelAttribute.widthAnchor.constraint(equalToConstant: 60),
            labelValue.widthAnchor.constraint(equalToConstant: 30),
        ])
    }

}
