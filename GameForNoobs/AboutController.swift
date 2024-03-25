//
//  AboutController.swift
//  GameForNoobs
//
//  Created by f f on 04.03.2024.
//

import UIKit

class AboutController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    let gameService = GameService()
    lazy var donations = gameService.getDonationsCards()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI() {
        imageView1.layer.borderWidth = 1
        imageView1.layer.borderColor = UIColor(resource: .highlightButtonBackground).cgColor
        
        imageView2.layer.borderWidth = 1
        imageView2.layer.borderColor = UIColor(resource: .highlightButtonBackground).cgColor
    }
    
    //MARK: -UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        donations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationCardCell", for: indexPath) as! DonationCardCell
        cell.bind(model: donations[indexPath.item])
        return cell
    }
    
    //MARK: -UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 128, height: 128)
    }
}
