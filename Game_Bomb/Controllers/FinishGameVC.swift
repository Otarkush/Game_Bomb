//
//  FinishGameVC.swift
//  Game_Bomb
//
//  Created by vp.off on 12.02.2025.
//

import UIKit

final class FinishGameVC: UIViewController {
    private let contentDataManager: IContentDataManager!
    
    //MARK: - Init
    init(contentDataManager: IContentDataManager) {
        self.contentDataManager = contentDataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let navigationBar = CustomNavigationBar()
    private let labelBot = UILabel()
    
    private let looserTasks = [
        "В следующем раунде перед каждым ответом делать одно приседание",
        "В следующем раунде перед каждым ответом подпрыгнуть",
        "В следующем раунде перед каждым ответом сделать поворот вокруг себя",
        "В следующем раунде перед каждым ответом дотронуться до пола руками",
        "В следующем раунде перед каждым ответом сделать руками большой круг",
        "В следующем раунде во время каждого ответа подпрыгнуть три раза"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        
        view.backgroundColor = UIColor(red: 245/255, green: 244/255, blue: 238/255, alpha: 1.0)
        
        let background = UIImageView(image: UIImage(named: "bg"))
        background.contentMode = .scaleAspectFill
        background.frame = view.bounds
        view.addSubview(background)

        
        navigationBar.titleOfLabel.text = "Конец игры"
        navigationBar.iconRight.isHidden = true
        navigationBar.iconLeft.isHidden = true
//        navigationBar.iconRight.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        addChild(navigationBar)
        view.addSubview(navigationBar.view)
        navigationBar.didMove(toParent: self)
        
        let imageBomb = UIImageView(image: UIImage(named: "image 9"))
        imageBomb.contentMode = .scaleAspectFit
        imageBomb.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageBomb)

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
        firstButton.addTarget(self, action: #selector(nextTask), for: .touchUpInside)
        view.addSubview(firstButton)
        
        let secondButton = UIButton(type: .system)
        secondButton.setTitle("Начать заново", for: .normal)
        secondButton.setTitleColor(.black, for: .normal)
        secondButton.layer.cornerRadius = 10
        secondButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        secondButton.backgroundColor = UIColor(red: 1.0, green: 210/255, blue: 94/255, alpha: 1.0)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.addTarget(self, action: #selector(newGame), for: .touchUpInside)
        view.addSubview(secondButton)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [firstButton, secondButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 16
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsStackView)
        
        navigationBar.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            navigationBar.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            navigationBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.view.heightAnchor.constraint(equalToConstant: 60),
            
        ])
        
        NSLayoutConstraint.activate([
            imageBomb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 69),
            imageBomb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57),
            imageBomb.topAnchor.constraint(equalTo: navigationBar.view.bottomAnchor, constant: 65),
            imageBomb.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -362),
            
            labelBot.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            labelBot.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            labelBot.topAnchor.constraint(equalTo: view.topAnchor, constant: 512),
            labelBot.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -190),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buttonsStackView.topAnchor.constraint(equalTo: labelBot.bottomAnchor, constant: 20)
        ])
    }
    
    func setupNavigation() {
        
        navigationBar.titleOfLabel.text = "Конец игры"
        navigationBar.iconRight.isHidden = true
        navigationBar.iconLeft.isHidden = true
        addChild(navigationBar)
        view.addSubview(navigationBar.view)
        navigationBar.didMove(toParent: self)
    }
    
   
    @objc func nextTask() {
        labelBot.text = looserTasks[Int.random(in: 0..<looserTasks.count)]
    }
    
    @objc func newGame() {
        print("Button Next Game")
        let models = contentDataManager.getSelectedModels()
        let gameVC = GameViewController(models: models, contentDataManager: contentDataManager)
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
}
