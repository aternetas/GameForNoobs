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
    func clickOnButton(cardId: String) {
        print(cardId)
    }
    
    func clickOnCell(cardId: String) {
        print(cardId + "cell")
    }
    
    //MARK: -UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (tableView.cellForRow(at: indexPath) as! GameCardCell).clickOn()
    }
    
    //MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCardCell", for: indexPath) as! GameCardCell
        cell.bind(model: cards[indexPath.item])
        cell.delegate = self
        return cell
    }
}
