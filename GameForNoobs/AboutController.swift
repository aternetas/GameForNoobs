//
//  AboutController.swift
//  GameForNoobs
//
//  Created by f f on 04.03.2024.
//

import UIKit

class AboutController: UIViewController {
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
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
}
