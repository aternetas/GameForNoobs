//
//  GameCardCell.swift
//  GameForNoobs
//
//  Created by f f on 07.03.2024.
//

import UIKit

class GameCardCell: UITableViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(model: GameCardModel) {
        photoView.image = UIImage(named: model.cardName)
        label.text = model.type.rawValue
    }

}
