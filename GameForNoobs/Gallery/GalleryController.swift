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
    private var cards: [GameCardModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        gameService.getCardsAsync { models in
            DispatchQueue.main.async {
                self.cards = models
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: -GameCardDelegateProtocol
    func clickOnButton(cardId: String) {
        print(cardId)
    }
    
    func clickOnCell(cardId: String) {
        print(cardId + "cell")
    }
    
    func trailingOnCell() {
        print("trailing")
    }
    
    //MARK: -UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (tableView.cellForRow(at: indexPath) as! GameCardCell).clickOn()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "🗑") { _, _, completionHandler in
            print("delete action")
            completionHandler(true)
        }
        
        let editAction = UIContextualAction(style: .normal, title: "✏️") { _, _, completionHandler in
            print("edit action")
            completionHandler(true)            
        }
        
        deleteAction.backgroundColor = UIColor.black
        editAction.backgroundColor = UIColor.green
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        (tableView.cellForRow(at: indexPath) as! GameCardCell).trailingOn()
        
        return swipeConfiguration
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
