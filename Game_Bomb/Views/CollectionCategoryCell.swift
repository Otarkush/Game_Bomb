//
//  CollectionCategoryCell.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

final class CollectionCategoryCell: UICollectionViewCell {
    private let viewBg = UIView()
    private let imageView = UIImageView()
    private let label = UILabel()
    private var isChecked = Bool()
    
    var action: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Model) {
        imageView.image = UIImage(named: model.image)
        label.text = model.type
        isChecked = model.isMark
    }
    
    func cellTapped() {
        isChecked.toggle()
        updateBackgroundColor()
        action?()
    }
    
    private func updateBackgroundColor() {
        viewBg.backgroundColor = isChecked ? UIColor.selectedCategory : UIColor.white
    }
}


private extension CollectionCategoryCell {
    func setupViews() {
        contentView.addSubview(viewBg)
        viewBg.addSubview(imageView)
        viewBg.addSubview(label)

        viewBg.layer.cornerRadius = 15
        viewBg.layer.borderWidth = 1
        viewBg.layer.borderColor = UIColor.black.cgColor
        viewBg.layer.shadowColor = UIColor.black.cgColor
        viewBg.layer.shadowOpacity = 0.1
        viewBg.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewBg.layer.shadowRadius = 3
        
        setupImage()
        setupLabel()
    }
    
    func setupImage() {
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
    }
    
    func setupLabel() {
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
    }
}


private extension CollectionCategoryCell {
    func setupLayout() {
        [viewBg, imageView, label].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            viewBg.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewBg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewBg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewBg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            label.bottomAnchor.constraint(equalTo: viewBg.bottomAnchor, constant: -12),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 32),
            imageView.centerXAnchor.constraint(equalTo: viewBg.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
