//
//  GameViewController.swift
//  Game_Bomb
//
//  Created by Ordoko on 10.02.2025.
//


import UIKit
import DotLottie
import AVFoundation

enum GameState {
    case notStarted
    case started
    case paused
}

class GameViewController: UIViewController {
    
    //MARK: - Private Property
    private var textLabel = UILabel()
    private var startGameButton = UIButton()
    private var pauseButton = UIButton()
    private var backButton = UIButton()
    private var animationDotLottieView: DotLottieAnimationView!
    private var dotLottieView: DotLottieView!
    private var backgroundImageView = UIImageView()
    private var models: [Model]
    private let navigationBar = CustomNavigationBar()
   // private let contentDataManager: IContentDataManager!
    private var musicPlayer: AVAudioPlayer?
    private var tickPlayer: AVAudioPlayer?
    private var timer: Timer?
    private var timerStartTime: Date?
    private var remainingTime: TimeInterval = 20.0
    private var state: GameState = .notStarted
    
    
    //MARK: - Init
    required init(models: [Model]) {
        self.models = models
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        if state == .notStarted {
            textLabel.font = UIFont(name: "SFProRounded-Medium", size: 28)
            textLabel.text = "Нажмите “Запустить”\nчтобы начать игру"
           
            // setup Animation
            animationDotLottieView = makeAnimationView()
            view.addSubview(animationDotLottieView)
            startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        }
       
        print("загружено \(models.count) моделей")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("didDisapear")
    }
    
    //MARK: - Func

    @objc func startGame() {
        state = .started
        startGameButton.removeFromSuperview()
        showQuestion()
        playBombAnimation()
        startTimer()
        startMusic()
        startTickSound()
    }
    
    @objc func pauseGame() {
        if state == .started {
            state = .paused
            pauseBombAnimation()
            pauseTimer()
            tickPlayer?.pause()
            musicPlayer?.pause()
        } else if state == .paused {
            state = .started
            playBombAnimation()
            resumeTimer()
            tickPlayer?.play()
            musicPlayer?.play()
        }
    }
    
    func startTimer() {
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
        self.musicPlayer = try? AVAudioPlayer(contentsOf: url!)
        self.musicPlayer?.play()
        state = .notStarted
        remainingTime = 20.0
        self.animationDotLottieView.removeFromSuperview()
    }
    
    @objc func backToMainVC() {
        musicPlayer?.stop()
        tickPlayer?.stop()
        timer?.invalidate()
    }
    
    func startMusic() {
        let url = Bundle.main.url(forResource: "dance-in-the-sun", withExtension: "wav")
        musicPlayer = try! AVAudioPlayer(contentsOf: url!)
        musicPlayer?.play()
    }
    
    func pauseMusic() {
        musicPlayer?.pause()
    }
    
    func resumeMusic() {
        musicPlayer?.play()
    }

    
    func startTickSound() {
        let url2 = Bundle.main.url(forResource: "tikane-taymera-bombyi", withExtension: "wav")
        tickPlayer = try? AVAudioPlayer(contentsOf: url2!)
        tickPlayer?.play()
    }
    
    func resumeTickSound() {
        tickPlayer?.play()
    }
    
    func playBombAnimation() {
        let _ = animationDotLottieView.dotLottieViewModel.play()
    }
    
    func pauseBombAnimation() {
        let _ = animationDotLottieView.dotLottieViewModel.pause()
    }
    
    private func showNextScreen() {
        let nextVC = FinishGameVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }

    func showQuestion() {
        for model in models {
            let questions = model.questions
            let randomQuestions = questions[Int.random(in: 0..<questions.count)]
            textLabel.text = randomQuestions.question
        }
        textLabel.font = UIFont(name: "SFProRounded-Black", size: 28)
    }
    
    //MARK: Setup UI
    
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
    
    func setupNavigationBar() {
        navigationBar.titleOfLabel.text = "Игра"
        navigationBar.iconRight.setImage(UIImage(resource:.vector1), for: .normal)
        navigationBar.iconRight.addTarget(self, action: #selector(pauseGame), for: .touchUpInside)
        navigationBar.iconLeft.addTarget(self, action: #selector(backToMainVC), for: .touchUpInside)
        addChild(navigationBar)
        navigationBar.didMove(toParent: self)
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
        startButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOpacity = 0.4
        startButton.layer.shadowRadius = 4
        
        //startButton.layer.opacity = 1
        startButton.layer.cornerRadius = 10
        startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
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
        animationDotLottieView.dotLottieViewModel.setSpeed(speed: 0.40)
        return animationDotLottieView
    }
}
