//
//  CollectionCategoryCell.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

final class CollectionCategoryCell: UICollectionViewCell {
    private var viewBg = UIView()
    private var imageView = UIImageView()
    private var iconView = UIImageView()
    private var label = UILabel()
    private var isChecked = Bool()
    
    var action: ((UICollectionViewCell) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    init(imageView: UIImageView, iconView: UIImageView, label: String) {
        super.init(frame: .zero)
        self.imageView = imageView
        self.iconView = iconView
        self.label.text = label
        
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
        action?(self)
    }
    
    private func updateBackgroundColor() {
        viewBg.backgroundColor = isChecked ? UIColor.selectedCategory : UIColor(resource: .categoryCell)
        iconView.isHidden = isChecked ? false : true
    }
}


private extension CollectionCategoryCell {
    func setupViews() {
        contentView.addSubview(viewBg)
        viewBg.addSubview(imageView)
        viewBg.addSubview(label)
        viewBg.addSubview(iconView)

        viewBg.layer.cornerRadius = 15
        viewBg.layer.borderWidth = 1
        viewBg.layer.borderColor = UIColor.black.cgColor
        viewBg.layer.shadowColor = UIColor.black.cgColor
        viewBg.layer.shadowOpacity = 0.1
        viewBg.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewBg.layer.shadowRadius = 3
        
        setupImage()
        setupLabel()
        setupIcon()
    }
    
    func setupImage() {
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
    }
    
    func setupIcon() {
        iconView.image = UIImage(systemName: "checkmark.circle.fill")
        iconView.tintColor = .black
        iconView.frame.size = CGSize(width: 24, height: 24)
        iconView.isHidden = true
    }
    
    func setupLabel() {
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
    }
}


private extension CollectionCategoryCell {
    func setupLayout() {
        [viewBg, imageView, label, iconView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            viewBg.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewBg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewBg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewBg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            iconView.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 8),
            iconView.trailingAnchor.constraint(equalTo: viewBg.trailingAnchor, constant: -8),
            
            label.bottomAnchor.constraint(equalTo: viewBg.bottomAnchor, constant: -12),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 32),
            imageView.centerXAnchor.constraint(equalTo: viewBg.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
