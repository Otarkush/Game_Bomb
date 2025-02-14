//
//  FinishGameVC.swift
//  Game_Bomb
//
//  Created by vp.off on 12.02.2025.
//

import UIKit

class FinishGameVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 244/255, blue: 238/255, alpha: 1.0)
        
        
        let background = UIImageView(image: UIImage(named: "bg"))
        background.contentMode = .scaleAspectFill
        background.frame = view.bounds
        view.addSubview(background)
        
        let imageBomb = UIImageView(image: UIImage(named: "image 9"))
        imageBomb.contentMode = .scaleAspectFit
        imageBomb.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageBomb)
        
        let labelTop = UILabel()
        labelTop.text = "Конец игры"
        labelTop.textColor = .black
        labelTop.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        labelTop.textAlignment = .center
        labelTop.numberOfLines = 0
        labelTop.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelTop)
        
        let labelBot = UILabel()
        labelBot.text = "В следующем раунде после каждого ответа хлопать в ладоши"
        labelBot.textColor = .black
        labelBot.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        labelBot.textAlignment = .center
        labelBot.numberOfLines = 0
        labelBot.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelBot)
        
        let firstButton = UIButton(type: .system)
        firstButton.setTitle("Другое задание", for: .normal)
        firstButton.setTitleColor(.black, for: .normal)
        firstButton.layer.cornerRadius = 10
        firstButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        firstButton.backgroundColor = UIColor(red: 1.0, green: 210/255, blue: 94/255, alpha: 1.0)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.addTarget(self, action: #selector(firstButtonTapped), for: .touchUpInside)
        view.addSubview(firstButton)
        
        let secondButton = UIButton(type: .system)
        secondButton.setTitle("Начать заново", for: .normal)
        secondButton.setTitleColor(.black, for: .normal)
        secondButton.layer.cornerRadius = 10
        secondButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        secondButton.backgroundColor = UIColor(red: 1.0, green: 210/255, blue: 94/255, alpha: 1.0)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.addTarget(self, action: #selector(secondButtonTapped), for: .touchUpInside)
        view.addSubview(secondButton)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [firstButton, secondButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 16
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            imageBomb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 69),
            imageBomb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57),
            imageBomb.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            imageBomb.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -362),
            
            labelTop.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95),
            labelTop.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -95),
            labelTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            labelTop.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -727),
            
            labelBot.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            labelBot.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            labelBot.topAnchor.constraint(equalTo: view.topAnchor, constant: 489),
            labelBot.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -219),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buttonsStackView.topAnchor.constraint(equalTo: labelBot.bottomAnchor, constant: 43)
        ])
    }
    
    @objc func firstButtonTapped() {
        print("Первая кнопка нажата!")
    }
    
    @objc func secondButtonTapped() {
        print("Вторая кнопка нажата!")
    }
}
