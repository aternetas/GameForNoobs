//
//  NoobGameController.swift
//  GameForNoobs
//
//  Created by f f on 03.03.2024.
//

import UIKit

class NoobGameController: UIViewController {
    
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let gameService: GameService = GameService()
    var currentCard: GameCardModel?
    var currentQuestion: CardType?
    var cards: [GameCardModel] = []
    var currentProgress: Float = 0.0
    lazy var winningImage: UIImageView = UIImageView()
    var progressBarWinningCount: Float = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        cards = gameService.getCards()
        playGame()
    }
    
    func playGame() {
        currentCard = cards.randomElement()
        currentQuestion = CardType.allCases.randomElement()
        showCurrentCard(currentCard: currentCard, currentQuestion: currentQuestion)
    }
    
    func showCurrentCard(currentCard: GameCardModel?, currentQuestion: CardType?) {
        if let currentCard = currentCard, let questionType = currentQuestion {
            let question = questionType.rawValue
            gameImageView.image = UIImage(named: currentCard.cardName)
            gameLabel.text = "Это \(question)?"
            yesButton.setTitle(question, for: .normal)
            noButton.setTitle("не \(question)", for: .normal)
        } else {
            showError()
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Я сломался", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "fix", style: .destructive, handler: { _ in
            self.playGame()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onClickYesButton(_ sender: Any) {
        guard let cardType = currentCard?.type, let questionType = currentQuestion else { return }
        gameResult(isWin: cardType == questionType)
    }
    
    @IBAction func onClickNoButton(_ sender: Any) {
        guard let cardType = currentCard?.type, let questionType = currentQuestion else { return }
        gameResult(isWin: cardType != questionType)
    }
    
    func gameResult(isWin: Bool) {
        gameLabel.text = isWin ? "Верно" : "Неверно"
        
        currentProgress = isWin ? currentProgress + 1/progressBarWinningCount :
            currentProgress - 1/progressBarWinningCount
        currentProgress = currentProgress < 0 ? 0 : currentProgress
        progressBar.setProgress(currentProgress, animated: true)
        
        restartButton.isHidden = false
        yesButton.isEnabled = false
        noButton.isEnabled = false
        
        if currentProgress == 1.0 {
            setWinningImage()
        }
    }
    
    @IBAction func onClickRestartButton(_ sender: Any) {
        restartButton.isHidden = true
        yesButton.isEnabled = true
        noButton.isEnabled = true
        playGame()
    }
    
    func initUI() {
        progressBar.progress = currentProgress
        restartButton.layer.cornerRadius = 22
        restartButton.layer.borderWidth = 0.5
        restartButton.layer.borderColor = UIColor.systemPurple.cgColor
    }
    
    func setWinningImage() {
        winningImage.contentMode = .scaleAspectFit
        winningImage.frame.size = .init(width: 400, height: 400)
        winningImage.center = view.center
        winningImage.image = UIImage(named: "Win")
        view.addSubview(winningImage)
    }
}
