//
//  CategoryCell.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 13.01.2024.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    // MARK: - переменные
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupViews()
    }
    
    // MARK: - настройка вьюшек
    
    private func setupViews() {
        addSubview(button)
        button.addSubview(iconImageView)
        button.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconImageView.topAnchor.constraint(equalTo: button.topAnchor),
            iconImageView.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 0.7),
            iconImageView.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 0.7),
            iconImageView.centerXAnchor.constraint(equalTo: button.centerXAnchor),

            nameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor),
        ])
    }
    
    func configure(withIcon icon: UIImage, name: String) {
        iconImageView.image = icon
        nameLabel.text = name
    }
}

