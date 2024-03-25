//
//  GalleryController.swift
//  GameForNoobs
//
//  Created by f f on 06.03.2024.
//

import UIKit

class GalleryController: UIViewController, UITableViewDataSource, UITableViewDelegate, GameCardDelegateProtocol {
    @IBOutlet weak var tableView: UITableView!
    let gameService = GameService()
    lazy var cards = gameService.getCards()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: -GameCardDelegateProtocol
    func clickCard(cardId: String) {
        print(cardId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCardCell", for: indexPath) as! GameCardCell
        cell.bind(model: cards[indexPath.item])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
