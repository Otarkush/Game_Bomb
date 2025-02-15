//
//  MainVC.swift
//  Game_Bomb
//
//  Created by Phan56 on 10.02.2025.
//

import UIKit

class MainVC: UIViewController {
    
    private let contentDataManager: IContentDataManager
    
    //MARK: - Init
    init(contentDataManager: IContentDataManager) {
        self.contentDataManager = contentDataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let nameLabelFist: UILabel = {
        let label = UILabel()
        label.text = "Игра для компании"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "SFProDisplay-Bold", size: 28)
//        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabelSecond: UILabel = {
        let label = UILabel()
        label.text = "БОМБА"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "SFProRounded-Black", size: 48)
//        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let buttonStartGame: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Старт игры", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 18)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .gray
        button.backgroundColor = UIColor(red: 245/255, green: 244/255, blue: 238/255, alpha: 1.0)
        
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        return button
    }()
    
    let buttonCategory: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Категории", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 18)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .gray
        button.backgroundColor = UIColor(red: 245/255, green: 244/255, blue: 238/255, alpha: 1.0)
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        return button
    }()
    
    let buttonSetting: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonHelp: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Vector-2"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let imageBomb: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bomb")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let stackTop: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackGameName: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.image = UIImage(named: "Topographic 3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let stackButton: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .gray
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        view.addSubview(imageBackground)
        stackTop.addArrangedSubview(buttonSetting)
        stackTop.addArrangedSubview(buttonHelp)
        view.addSubview(stackTop)
        
        stackGameName.addArrangedSubview(nameLabelFist)
        stackGameName.addArrangedSubview(nameLabelSecond)
        view.addSubview(stackGameName)
        view.addSubview(imageBomb)
        
        stackButton.addArrangedSubview(buttonStartGame)
        stackButton.addArrangedSubview(buttonCategory)
        view.addSubview(stackButton)
        
        buttonTapped()

        
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: view.topAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            stackTop.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            stackTop.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            
            stackGameName.topAnchor.constraint(equalTo: view.topAnchor, constant: 126),
            stackGameName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackGameName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            
            imageBomb.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageBomb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageBomb.widthAnchor.constraint(equalToConstant: 275),
            imageBomb.heightAnchor.constraint(equalToConstant: 300),
            
            stackButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            stackButton.topAnchor.constraint(equalTo: imageBomb.bottomAnchor, constant: 70),
            stackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            stackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            
        ])
    }
    
    func buttonTapped() {
        
//        buttonHelp.addTarget(self, action: #selector(tappedHelp), for: .touchUpInside)
        buttonHelp.addTarget(self, action: #selector(tappedHelp), for: .touchUpInside)
        buttonSetting.addTarget(self, action: #selector(tappedSetting), for: .touchUpInside)
        buttonStartGame.addTarget(self, action: #selector(tappedStartGame), for: .touchUpInside)
        buttonCategory.addTarget(self, action: #selector(tappedCategory), for: .touchUpInside)
        
    }
    
    @objc func tappedSetting() {
        print("setting button tapped")

    }
    
    @objc func tappedStartGame() {
        print("StartGame button tapped")
        
        let selectedModels = contentDataManager.getSelectedModels()
        let vc = GameViewController(models: selectedModels, contentDataManager: contentDataManager)
        navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func tappedCategory() {
        print("Category button tapped")
        
        let vc = CategoryViewController(contentDataManager: contentDataManager)
        navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func tappedHelp() {
            // Создаем контроллер для bottom sheet
            let helpVC = HelpVC()
            
            // Устанавливаем preferredContentSize
            helpVC.preferredContentSize = CGSize(width: view.frame.width, height: 600)
            
            // Настраиваем модальный стиль
            if let sheet = helpVC.sheetPresentationController {
                // Указываем поддерживаемые детенты
                let customDetent = UISheetPresentationController.Detent.custom(identifier: .medium) { context in
                    return min(600, context.maximumDetentValue)
                }
                sheet.detents = [customDetent]
                
                // Разрешаем интерактивное изменение размера
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.prefersEdgeAttachedInCompactHeight = true
                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
                sheet.prefersGrabberVisible = true
            }
            
            // Показываем bottom sheet
            present(helpVC, animated: true, completion: nil)
        }


}
