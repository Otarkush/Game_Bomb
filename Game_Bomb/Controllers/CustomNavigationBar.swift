//
//  NavigationController.swift
//  Game_Bomb
//
//  Created by user on 14.02.2025.
//

import UIKit

final class CustomNavigationBar: UIViewController {

    let navigationBar = UINavigationBar()
    
    lazy var titleOfLabel: UILabel = {
        let label = UILabel()
        label.text = "Screen Name"
        label.textColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "SFProRounded-Black", size: 30)
        return label
    }()
    
    lazy var iconRight: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource:.vector2), for: .normal)
        button.frame.size = CGSize(width: 24, height: 24)
        return button
    }()
    
    lazy var iconLeft: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource:.arrow), for: .normal)
        button.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        button.frame.size = CGSize(width: 24, height: 24)
        return button
    }()
    
    
   //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupLayout()
    }
    
    @objc func backButton() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            print("Ошибка: NavigationController не найден.")
        }
    }
    
    //MARK: - Private Methods
    private func setupNavigationBar() {
        
        navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationBar.shadowImage = UIImage()
        
        navigationBar.backgroundColor = .white
        navigationBar.barTintColor = .white
        navigationBar.tintColor = .black
        
        navigationBar.backgroundColor = .clear
        navigationBar.addSubview(titleOfLabel)
        navigationBar.addSubview(iconLeft)
        navigationBar.addSubview(iconRight)
        view.addSubview(navigationBar)
    }
    
    
    private func setupLayout() {
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        titleOfLabel.translatesAutoresizingMaskIntoConstraints = false
        iconLeft.translatesAutoresizingMaskIntoConstraints = false
        iconRight.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 50),
        
            titleOfLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleOfLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            iconLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            iconLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            iconRight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            iconRight.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }
}

