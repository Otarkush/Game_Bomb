//
//  HelpVC.swift
//  Game_Bomb
//
//  Created by Phan56 on 11.02.2025.
//

import UIKit

class HelpVC: UIViewController {
    
    let textGames = [
        TextGame(number: 1, text: "Все игроки становятся в круг"),
        TextGame(number: 2, text: "Первый игрок берет телефон и нажимает кнопку:"),
        TextGame(number: 3, text: "На экране появляется вопрос “Назовите Фрукт”.")
    ]
    
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(red: 245/255, green: 244/255, blue: 238/255, alpha: 1.0)
        image.image = UIImage(named: "Topographic 3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Правила Игры"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextOne: UILabel = {
        let label = UILabel()
        label.text = "Все игроки становятся в круг"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextTwo: UILabel = {
        let label = UILabel()
        label.text = "Первый игрок берет телефон и нажимает кнопку:"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextThree: UILabel = {
        let label = UILabel()
        label.text = "На экране появляется вопрос “Назовите Фрукт”."
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextFour: UILabel = {
        let label = UILabel()
        label.text = "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игрок."
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextFive: UILabel = {
        let label = UILabel()
        label.text = "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба."
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextSix: UILabel = {
        let label = UILabel()
        label.text = "Проигравшим считается тот, в чьих руках взорвалась бомба."
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextSeven: UILabel = {
        let label = UILabel()
        label.text = "Проигравшим считается тот, в чьих руках взорвалась бомба."
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelNumber1: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber2: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber3: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber4: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber5: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber6: UILabel = {
        let label = UILabel()
        label.text = "6"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber7: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    
    
    let stackHelp: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackLine1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let stackLine2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let stackLine3: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let stackLine4: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let stackLine5: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let stackLine6: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let stackLine7: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    func steckSetup() {
        stackLine1.addArrangedSubview(labelNumber1)
        stackLine1.addArrangedSubview(labeTextOne)
        stackLine2.addArrangedSubview(labelNumber2)
        stackLine2.addArrangedSubview(labeTextTwo)
        stackLine3.addArrangedSubview(labelNumber3)
        stackLine3.addArrangedSubview(labeTextThree)
        stackLine4.addArrangedSubview(labelNumber4)
        stackLine4.addArrangedSubview(labeTextFour)
        stackLine5.addArrangedSubview(labelNumber5)
        stackLine5.addArrangedSubview(labeTextFive)
        stackLine6.addArrangedSubview(labelNumber6)
        stackLine6.addArrangedSubview(labeTextSix)
        stackLine7.addArrangedSubview(labelNumber7)
        stackLine7.addArrangedSubview(labeTextSeven)
        
        stackHelp.addArrangedSubview(stackLine1)
        stackHelp.addArrangedSubview(stackLine2)
        stackHelp.addArrangedSubview(stackLine3)
        stackHelp.addArrangedSubview(stackLine4)
        stackHelp.addArrangedSubview(stackLine5)
        stackHelp.addArrangedSubview(stackLine6)
        stackHelp.addArrangedSubview(stackLine7)
        view.addSubview(stackHelp)
    }
    
    
    func setupUI() {
        view.backgroundColor = .gray
        view.addSubview(imageBackground)
        view.addSubview(labelTitle)
        view.addSubview(labelNumber1)
        
        steckSetup()
        
        
        
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: view.topAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            stackHelp.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20),
            stackHelp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackHelp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
//            labelNumber1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            labelNumber1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            
            
            ])
        
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HelpVC {
    
    func textLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    struct TextGame {
        let number: Int
        let text: String
    }
    

}

//#Preview {
//    HelpVC()
//}
