//
//  CategoryRulesViewController.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

final class CategoryRulesViewController: UIViewController {
    
    //MARK: - Private property
    private let titleLabel = UILabel()
    private let subTitle = UILabel()
    private let descriptionLabel = UILabel()
    private let categoryView1 = CategoryView(label: "Helo", image: UIImageView(image: UIImage(resource: .image1)))
    private let categoryView2 = CategoryView(label: "Helo", image: UIImageView(image: UIImage(resource: .image2)))
    private let categoryView3 = CategoryView(label: "Helo", image: UIImageView(image: UIImage(resource: .image3)))
    private let categoryView4 = CategoryView(label: "Helo", image: UIImageView(image: UIImage(resource: .image4)))
  
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupView()
    }
}


private extension CategoryRulesViewController {
    func setupView() {
        addSubviews()
        setupTitleLabel()
        setupDescription()
        setupSubTile()
        setupLayout()
    }
    
    func setupBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(resource: .bgRules)
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
    
    func addSubviews() {
        [titleLabel, subTitle, descriptionLabel, categoryView1, categoryView2, categoryView3, categoryView4].forEach {
            view.addSubview($0)
        }
    }
}

private extension CategoryRulesViewController {
    func setupTitleLabel() {
        titleLabel.text = "Правила игры"
        titleLabel.font = .systemFont(ofSize: 30, weight: .black)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
    }
    
    func setupSubTile() {
        subTitle.text = "В игре доступно 6 категорий и более 90 вопросов."
        subTitle.font = .systemFont(ofSize: 24, weight: .heavy)
        subTitle.numberOfLines = 0
        subTitle.textAlignment = .center
        subTitle.textColor = .black
    }
    
    func setupDescription() {
        descriptionLabel.text = "Можно выбрать сразу несколько категорий для игры."
        descriptionLabel.font = .systemFont(ofSize: 24, weight: .light)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
    }
}

private extension CategoryRulesViewController {
    func setupLayout() {
        [titleLabel, descriptionLabel, subTitle, categoryView1, categoryView2, categoryView3, categoryView4].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            subTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            descriptionLabel.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            categoryView1.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            categoryView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            categoryView2.topAnchor.constraint(equalTo: categoryView1.topAnchor),
            categoryView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            categoryView3.topAnchor.constraint(equalTo: categoryView1.bottomAnchor, constant: 24),
            categoryView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            categoryView4.topAnchor.constraint(equalTo: categoryView3.topAnchor),
            categoryView4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
           
            
        ])
    }
}
