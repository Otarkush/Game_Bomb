//
//  GameViewController.swift
//  Game_Bomb
//
//  Created by Ordoko on 10.02.2025.
//


import UIKit
import DotLottie
import AVFoundation

class GameViewController: UIViewController {
//    private let contentManager: IContentDataManager

    private var textLabel = UILabel()
    private var titleLabel = UILabel()
    private var startGameButton = UIButton()
    private var pauseButton = UIButton()
    private var backButton = UIButton()
    private var animationDotLottieView: DotLottieAnimationView!
    private var dotLottieView: DotLottieView!
    private var backgroundImageView = UIImageView()
    private var gameStarted = false
    private var questions: [Questions] = []
    private var musicPlayer: AVAudioPlayer!
    private var tickPlayer: AVAudioPlayer!
    private var timer: Timer!
    private var timerStartTime: Date?
    private var remainingTime: TimeInterval = 20.0 // Длительность таймера (в секундах)
    
//    required init(manager: IContentDataManager) {
//        self.contentManager = manager
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseGame), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backToMainVC), for: .touchUpInside)
        //mock
        questions = [Questions(question: "Какой газ необходим для дыхания человеку?"),
                     Questions(question: "Сколько планет в Солнечной системе?"),
                     Questions(question: "Как называется столица Австралии?")]
//        questions = contentManager.getSelectedCategory().flatMap { $0.questions }
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
        if animationDotLottieView.dotLottieViewModel.isPlaying() {
            let _ = animationDotLottieView.dotLottieViewModel.pause()
            pauseTimer()
            tickPlayer.pause()
            musicPlayer.pause()
        } else if gameStarted {
            startBombAnimation()
            resumeTimer()
            tickPlayer.play()
            musicPlayer.play()
        }
    }
    
    func startTimer() {
        // Запуск нового таймера
        timerStartTime = Date()
        timer = Timer.scheduledTimer(
            timeInterval: remainingTime,
            target: self,
            selector: #selector(completeAnimation),
            userInfo: nil,
            repeats: false
        )
    }
    
    func pauseTimer() {
        if let startTime = timerStartTime {
            remainingTime -= Date().timeIntervalSince(startTime)
        }
        timer?.invalidate()
        timer = nil
    }
    
    func resumeTimer() {
        startTimer()
    }
    
    @objc func completeAnimation() {
        let _ = animationDotLottieView.dotLottieViewModel.stop()
        print("Animation completed!")
        self.showNextScreen()
        let url = Bundle.main.url(forResource: "igra-zakonchena-fonovyim-zvukom", withExtension: "wav")
        self.musicPlayer = try! AVAudioPlayer(contentsOf: url!)
        self.musicPlayer.play()
    }
    
    @objc func backToMainVC() {
        musicPlayer.stop()
        tickPlayer.stop()
        dismiss(animated: true)
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
        let _ = animationDotLottieView.dotLottieViewModel.play()
        startTimer()
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
        let question = questions[Int.random(in: 0..<questions.count)]
        textLabel.text = question.question
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
        animationDotLottieView = makeAnimationView()
        view.addSubview(animationDotLottieView)
        
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
    
    func makeAnimationView() -> DotLottieAnimationView {
        let animation = DotLottieAnimation(
            fileName: "bomb",
            config: AnimationConfig(autoplay: false, loop: false, useFrameInterpolation: true)
        )
        let animationDotLottieView: DotLottieAnimationView = animation.view()
        animationDotLottieView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationDotLottieView.center = view.center
        animationDotLottieView.contentMode = .scaleAspectFit
        let animationView = DotLottieView(dotLottie: animation)
        self.dotLottieView = animationView
        animationDotLottieView.dotLottieViewModel.setSpeed(speed: 0.4)
        return animationDotLottieView
    }
}
