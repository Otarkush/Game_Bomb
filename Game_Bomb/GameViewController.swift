//
//  GameViewController.swift
//  Game_Bomb
//
//  Created by Ordoko on 10.02.2025.
//

import UIKit
import Lottie

class GameViewController: UIViewController {
    
    private var textLabel = UILabel()
    private var titleLabel = UILabel()
    private var startGameButton = UIButton()
    private var pauseButton = UIButton()
    private var backButton = UIButton()
    private var animationView = LottieAnimationView()
    private var backgroundImageView = UIImageView()
    private var gameStarted = false
    
    // add questions (temp)
    private let questions = [
        "Назови самую-самую-самую высокую гору на нашей планете Земля?",
        "Как зовут президента США?",
        "Столица Италии?"
    ]
    
    
    //TODO: this
    // make timer 30 sec
    // make music sound
    // make tick-tack sound
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseGame), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backToMainVC), for: .touchUpInside)
    }
    
    @objc func startGame() {
        gameStarted = true
        // remove the start button
        startGameButton.removeFromSuperview()
        // change the start textLabel
        setupQuestionLabel()
        // show the question
        showQuestion()
        // start the timer
        startTimer()
        // show the bomb with animation
        startBombAnimation()
    }
    
    @objc func pauseGame() {
        if animationView.isAnimationPlaying {
            animationView.pause()
        } else if gameStarted {
            animationView.play()
        }
    }
    
    @objc func backToMainVC() {
        dismiss(animated: true)
    }
    
    func startBombAnimation() {
        animationView.play()
    }
    
    func startTimer() {
        //TODO: this
    }
    
    func showQuestion() {
        textLabel.text = questions[Int.random(in: 0..<questions.count)]
    }
    
    func setupQuestionLabel() {
        textLabel.font = UIFont(name: "SFProRounded-Black", size: 28)
    }
    
    func setupUI() {
        // setup Background
        backgroundImageView = makeBackgroundView()
        view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // setup Title
        titleLabel = makeTitleLabel()
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
        
        // setup Pause button
        pauseButton = makePauseButton()
        view.addSubview(pauseButton)
        NSLayoutConstraint.activate([
            pauseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            pauseButton.widthAnchor.constraint(equalToConstant: 27),
            pauseButton.heightAnchor.constraint(equalToConstant: 27),
        ])
        
        // setup Back button
        backButton = makeBackButton()
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            backButton.widthAnchor.constraint(equalToConstant: 11),
            backButton.heightAnchor.constraint(equalToConstant: 19),
        ])
        
        // setup Text
        textLabel = makeTextLabel()
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 113)
        ])
        
        // setup Animation
        animationView = makeAnimationView()
        self.view.addSubview(animationView)
        
        // setup Start button
        startGameButton = makeStartButton()
        view.addSubview(startGameButton)
        
        NSLayoutConstraint.activate([
            startGameButton.widthAnchor.constraint(equalToConstant: 330),
            startGameButton.heightAnchor.constraint(equalToConstant: 55),
            startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -28)
        ])
    }
    
    func makeBackgroundView() -> UIImageView {
        let image = UIImageView()
        image.backgroundColor = UIColor(red: 0.961, green: 0.957, blue: 0.933, alpha: 1)
        image.image = UIImage(named: "Topographic 3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    func makeTitleLabel() -> UILabel {
        let textLabel = UILabel()
        textLabel.frame = CGRect(x: 0, y: 0, width: 329, height: 96)
        textLabel.textColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        textLabel.font = UIFont(name: "SFProRounded-Black", size: 30)
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textAlignment = .center
        textLabel.text = "Игра"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }
    
    func makeTextLabel() -> UILabel {
        let textLabel = UILabel()
        textLabel.frame = CGRect(x: 0, y: 0, width: 329, height: 96)
        textLabel.textColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        textLabel.font = UIFont(name: "SFProRounded-Medium", size: 28)
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textAlignment = .center
        textLabel.text = "Нажмите “Запустить”\nчтобы начать игру"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }
    
    func makeStartButton() -> UIButton {
        let startButton = UIButton()
        startButton.setTitle("Запустить", for: .normal)
        startButton.setTitleColor(UIColor(red: 0.235, green: 0.227, blue: 0.227, alpha: 1), for: .normal)
        startButton.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        startButton.backgroundColor = UIColor(red: 1, green: 0.822, blue: 0.367, alpha: 1)
        startButton.layer.shadowRadius = 5
        startButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        startButton.layer.opacity = 1
        startButton.layer.cornerRadius = 10
        startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
    }
    
    func makePauseButton() -> UIButton {
        let pauseButton = UIButton()
        pauseButton.setImage(UIImage(named: "Vector 1"), for: .normal)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        return pauseButton
    }
    
    func makeBackButton() -> UIButton {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "Arrow"), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }
    
    func makeAnimationView() -> LottieAnimationView {
        let animationView = LottieAnimationView(name: "bomb")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center // положила в центр
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 1.0
        return animationView
    }
}
