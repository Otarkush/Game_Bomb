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
        image.image = UIImage(named: "HelpViewBackground")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let labelBotton: UILabel = {
        let label = UILabel()
        label.text = "Старт Игры"
        label.textColor = .black
        label.backgroundColor = UIColor(red: 245/255, green: 244/255, blue: 238/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 167).isActive = true
        label.heightAnchor.constraint(equalToConstant: 28).isActive = true
//        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        
        label.layer.shadowOffset = CGSize(width: 3, height: 3)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.5
        label.layer.shadowRadius = 5
        

        return label
    }()
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Правила Игры"
        label.textColor = .black
        label.font = UIFont(name: "SFProRounded-Black", size: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextOne: UILabel = {
        let label = UILabel()
        label.text = "Все игроки становятся в круг"
        label.textColor = UIColor(red: 0.233, green: 0.226, blue: 0.226, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProRounded-Medium", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextTwo: UILabel = {
        let label = UILabel()
        label.text = "Первый игрок берет телефон и нажимает кнопку:"
        label.textColor = UIColor(red: 0.233, green: 0.226, blue: 0.226, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProRounded-Medium", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextThree: UILabel = {
        let label = UILabel()
        label.text = "На экране появляется вопрос “Назовите Фрукт”."
        label.textColor = UIColor(red: 0.233, green: 0.226, blue: 0.226, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProRounded-Medium", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextFour: UILabel = {
        let label = UILabel()
        label.text = "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игрок."
        label.textColor = UIColor(red: 0.233, green: 0.226, blue: 0.226, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProRounded-Medium", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextFive: UILabel = {
        let label = UILabel()
        label.text = "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба."
        label.textColor = UIColor(red: 0.233, green: 0.226, blue: 0.226, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProRounded-Medium", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextSix: UILabel = {
        let label = UILabel()
        label.text = "Проигравшим считается тот, в чьих руках взорвалась бомба."
        label.textColor = UIColor(red: 0.233, green: 0.226, blue: 0.226, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProRounded-Medium", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labeTextSeven: UILabel = {
        let label = UILabel()
        label.text = "Если выбран режим игры “С Заданиями”, то проигравший выполняет задание."
        label.textColor = UIColor(red: 0.233, green: 0.226, blue: 0.226, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProRounded-Medium", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelNumber1: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = UIColor(red: 0.235, green: 0.227, blue: 0.227, alpha: 1)
        label.backgroundColor = UIColor(red: 1, green: 0.822, blue: 0.367, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        
        label.layer.shadowOffset = CGSize(width: 3, height: 3)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.5
        label.layer.shadowRadius = 5
        
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
    
        return label
    }()
    
    let labelNumber2: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = UIColor(red: 0.235, green: 0.227, blue: 0.227, alpha: 1)
        label.backgroundColor = UIColor(red: 1, green: 0.822, blue: 0.367, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber3: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.textColor = UIColor(red: 0.235, green: 0.227, blue: 0.227, alpha: 1)
        label.backgroundColor = UIColor(red: 1, green: 0.822, blue: 0.367, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber4: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textColor = UIColor(red: 0.235, green: 0.227, blue: 0.227, alpha: 1)
        label.backgroundColor = UIColor(red: 1, green: 0.822, blue: 0.367, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber5: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = UIColor(red: 0.235, green: 0.227, blue: 0.227, alpha: 1)
        label.backgroundColor = UIColor(red: 1, green: 0.822, blue: 0.367, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber6: UILabel = {
        let label = UILabel()
        label.text = "6"
        label.textColor = UIColor(red: 0.235, green: 0.227, blue: 0.227, alpha: 1)
        label.backgroundColor = UIColor(red: 1, green: 0.822, blue: 0.367, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    let labelNumber7: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textColor = UIColor(red: 0.235, green: 0.227, blue: 0.227, alpha: 1)
        label.backgroundColor = UIColor(red: 1, green: 0.822, blue: 0.367, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 29/2
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 29).isActive = true
        label.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return label
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    
    func setupUI() {
        view.addSubview(imageBackground)
        view.addSubview(labelTitle)
        view.addSubview(labelNumber1)
        view.addSubview(labelNumber2)
        view.addSubview(labelNumber3)
        view.addSubview(labelNumber4)
        view.addSubview(labelNumber5)
        view.addSubview(labelNumber6)
        view.addSubview(labelNumber7)
        
        view.addSubview(labeTextOne)
        view.addSubview(labeTextTwo)
        view.addSubview(labeTextThree)
        view.addSubview(labeTextFour)
        view.addSubview(labeTextFive)
        view.addSubview(labeTextSix)
        view.addSubview(labeTextSeven)
        
        view.addSubview(labelBotton)

        
        
        
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: view.topAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            labelTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            labelNumber1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            labelNumber1.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
            labeTextOne.leadingAnchor.constraint(equalTo: labelNumber1.leadingAnchor, constant: 40),
            labeTextOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            
            labelNumber2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            labelNumber2.topAnchor.constraint(equalTo: labelNumber1.bottomAnchor, constant: 28),
            labeTextTwo.leadingAnchor.constraint(equalTo: labelNumber2.leadingAnchor, constant: 40),
            labeTextTwo.topAnchor.constraint(equalTo: labeTextOne.bottomAnchor, constant: 30),
            labeTextTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            labelBotton.topAnchor.constraint(equalTo: labeTextTwo.bottomAnchor, constant: 7),
            labelBotton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 112),
            
            labelNumber3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            labelNumber4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            labelNumber5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            labelNumber6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            labelNumber7.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            labeTextThree.leadingAnchor.constraint(equalTo: labelNumber3.leadingAnchor, constant: 40),
            labeTextFour.leadingAnchor.constraint(equalTo: labelNumber4.leadingAnchor, constant: 40),
            labeTextFive.leadingAnchor.constraint(equalTo: labelNumber5.leadingAnchor, constant: 40),
            labeTextSix.leadingAnchor.constraint(equalTo: labelNumber6.leadingAnchor, constant: 40),
            labeTextSeven.leadingAnchor.constraint(equalTo: labelNumber7.leadingAnchor, constant: 40),
            
            labeTextThree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            labeTextFour.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labeTextFive.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            labeTextSix.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            labeTextSeven.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            labelNumber3.topAnchor.constraint(equalTo: labelNumber2.bottomAnchor, constant: 80),
            labelNumber4.topAnchor.constraint(equalTo: labelNumber3.bottomAnchor, constant: 40),
            labelNumber5.topAnchor.constraint(equalTo: labelNumber4.bottomAnchor, constant: 50),
            labelNumber6.topAnchor.constraint(equalTo: labelNumber5.bottomAnchor, constant: 55),
            labelNumber7.topAnchor.constraint(equalTo: labelNumber6.bottomAnchor, constant: 30),
            
            labeTextThree.topAnchor.constraint(equalTo: labeTextTwo.bottomAnchor, constant: 50),
            labeTextFour.topAnchor.constraint(equalTo: labeTextThree.bottomAnchor, constant: 15),
            labeTextFive.topAnchor.constraint(equalTo: labeTextFour.bottomAnchor, constant: 15),
            labeTextSix.topAnchor.constraint(equalTo: labeTextFive.bottomAnchor, constant: 15),
            labeTextSeven.topAnchor.constraint(equalTo: labeTextSix.bottomAnchor, constant: 15),
        
            
            
            
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
    
    struct TextGame {
        let number: Int
        let text: String
    }
    

}
