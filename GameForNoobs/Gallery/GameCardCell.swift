//
//  GameCardCell.swift
//  GameForNoobs
//
//  Created by f f on 07.03.2024.
//

import UIKit

protocol GameCardDelegateProtocol {
    func clickOnCell(cardId: String)
    func clickOnButton(cardId: String)
    func trailingOnCell()
}

class GameCardCell: UITableViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var delegate: GameCardDelegateProtocol?
    private var id: String!
    
    func bind(model: GameCardModel) {
        id = model.id
        photoView.image = UIImage(named: model.cardName)
        label.text = model.type.rawValue
    }
    
    @IBAction func clickOnButton(_ sender: UIButton) {
        delegate?.clickOnButton(cardId: id)
    }
    
    func clickOn() {
        delegate?.clickOnCell(cardId: id)
    }
    
    func trailingOn() {
        delegate?.trailingOnCell()
    }
}
