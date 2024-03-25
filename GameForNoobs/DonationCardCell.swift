//
//  Donation.swift
//  GameForNoobs
//
//  Created by f f on 13.03.2024.
//

import UIKit

class DonationCardCell: UICollectionViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func bind(model: DonationCardModel) {
        label.text = model.donationName
        photoView.image = UIImage(named: model.type.rawValue.capitalized)
    }
}
