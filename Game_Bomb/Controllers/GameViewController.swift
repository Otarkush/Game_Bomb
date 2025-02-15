//
//  GameViewController.swift
//  Game_Bomb
//
//  Created by Ordoko on 10.02.2025.
//




/*
 
 // Чтобы протестировать этот контроллер, вставь этот код вместо кода класса ViewController в файле "ViewController.swift"
 
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 100, y: 300), size: CGSize(width: 200, height: 50)))
        button.setTitle("Game screen", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        let gameVC = GameViewController()
        gameVC.modalPresentationStyle = .fullScreen
        self.present(gameVC, animated: true)
    }

}
*/

import UIKit
import Lottie
import AVFoundation

final class GameViewController: UIViewController {
    
    //MARK: - Private Property
    private var textLabel = UILabel()
    private var startGameButton = UIButton()
    private var animationView = LottieAnimationView()
    private var backgroundImageView = UIImageView()
    private var gameStarted = false
    private var models: [Model]
    private let navigationBar = CustomNavigationBar()
    private var musicPlayer: AVAudioPlayer!
    private var tickPlayer: AVAudioPlayer!
    
    
    //MARK: - Init
    required init(models: [Model]) {
        self.models = models
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        view.backgroundColor = .white
        setupNavigationBar()
        
        //mock
//        questions = [Questions(question: "Какой газ необходим для дыхания человеку?"),
//                     Questions(question: "Сколько планет в Солнечной системе?"),
//                     Questions(question: "Как называется столица Австралии?")]
        
//        questions = contentManager.getSelectedCategory().flatMap { $0.questions }
        
       
        print("GameViewController loaded with \(models.count) models")
        
    }
    
    func setupNavigationBar() {
        navigationBar.titleOfLabel.text = "Игра"
        navigationBar.iconRight.setImage(UIImage(resource:.vector1), for: .normal)
        navigationBar.iconRight.addTarget(self, action: #selector(pauseGame), for: .touchUpInside)
        addChild(navigationBar)
        navigationBar.didMove(toParent: self)
    }

    
    @objc func startGame() {
        gameStarted = true
        startGameButton.removeFromSuperview()
        setupQuestionLabel()
        showQuestion()
        startBombAnimation()
        startMusic()
        startTickSound()
    }
    
    
    @objc func pauseGame() {
        if animationView.isAnimationPlaying {
            animationView.pause()
            tickPlayer.pause()
            musicPlayer.pause()
        } else if gameStarted {
            startBombAnimation()
            tickPlayer.play()
            musicPlayer.play()
        }
    }
    
    func startMusic() {
        let url = Bundle.main.url(forResource: "dance-in-the-sun", withExtension: "wav")
        musicPlayer = try! AVAudioPlayer(contentsOf: url!)
        musicPlayer.play()
    }
    
    func startTickSound() {
        let url2 = Bundle.main.url(forResource: "tikane-taymera-bombyi", withExtension: "wav")
        tickPlayer = try! AVAudioPlayer(contentsOf: url2!)
        tickPlayer.play()
    }
    
    func startBombAnimation() {
        animationView.play(fromFrame: 0, toFrame: 478) { finished in
            if finished {
                print("Animation segment completed!")
                self.showNextScreen()
                let url = Bundle.main.url(forResource: "igra-zakonchena-fonovyim-zvukom", withExtension: "wav")
                self.musicPlayer = try! AVAudioPlayer(contentsOf: url!)
                self.musicPlayer.play()
            }
        }
    }
    
    // TODO: отобразить готовый или сверстать на этом же
    private func showNextScreen() {
        let nextVC = UIViewController()
        nextVC.view.backgroundColor = .red
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 30, y: 300), size: CGSize(width: 350, height: 50)))
        label.text = "ВЫ САМОЕ СЛАБОЕ ЗВЕНО! ПРОЩАЙТЕ!"
        nextVC.view.addSubview(label)
        present(nextVC, animated: true)
    }

    func showQuestion() {
        for model in models {
            let questions = model.questions
            for question in questions {
                textLabel.text = question.question
            }
        }
    }
    
    func setupQuestionLabel() {
        textLabel.font = UIFont(name: "SFProRounded-Black", size: 28)
    }
    
    func setupUI() {
        // setup Background
        backgroundImageView = makeBackgroundView()
        view.addSubview(backgroundImageView)
        view.addSubview(navigationBar.view)
        navigationBar.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBar.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            navigationBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.view.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        // setup Text
        textLabel = makeTextLabel()
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140)
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
        image.image = UIImage(named: "bg")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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

    
    func makeAnimationView() -> LottieAnimationView {
        let animationView = LottieAnimationView(name: "bomb")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center // положила в центр
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        
        // Вычисляем нужную скорость
        let originalDuration = animationView.animation?.duration ?? 1.0
        let targetDuration: TimeInterval = 24.0
        let animationSpeed = CGFloat(originalDuration / targetDuration)
        print(animationSpeed)
        animationView.animationSpeed = animationSpeed
        return animationView
    }
}
