//
//  CategoryView.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit


final class CategoryView: UIView {
    
    //MARK: - Private property
    private var label = UILabel()
    private var image = UIImageView()
    private var iconView = UIImageView()

    
    //MARK: - Init
    init(
        label: String,
        image: UIImageView,
        iconView: UIImage? = UIImage(systemName: "checkmark.circle.fill")
    ) {
        self.label.text = label
        self.image = image
        self.iconView.image = iconView
        super.init(frame: .zero)
        
        widthAnchor.constraint(equalToConstant: 150).isActive = true
        heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        backgroundColor = UIColor(resource: .categoryCell)
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 3
        
        setup()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Settings
private extension CategoryView {
    func setup() {
      
        addSubviews()
        setupLabel()
        setupLayout()
    }
    
    func addSubviews() {
        [label, image, iconView].forEach { view in
            addSubview(view)
        }
    }
    
    func setupLabel() {
        label.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func setupImage() {
        image.tintColor = .black
    }
    
    func setupIcon() {
        iconView.tintColor = .black
        iconView.frame.size = CGSize(width: 24, height: 24)
    }
}

//MARK: - Setup layout
private extension CategoryView {
    func setupLayout() {
        [label, image, iconView].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -12),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalToConstant: 80),
            
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
        ])
    }
}
