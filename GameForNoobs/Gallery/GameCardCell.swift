//
//  GameCardCell.swift
//  GameForNoobs
//
//  Created by f f on 07.03.2024.
//

import UIKit

protocol GameCardDelegateProtocol {
    func clickCard(cardId: String)
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
    
    @IBAction func clickButton(_ sender: UIButton) {
        delegate?.clickCard(cardId: id)
    }
}
