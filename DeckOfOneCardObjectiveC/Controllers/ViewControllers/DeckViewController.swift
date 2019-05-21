//
//  DeckViewController.swift
//  DeckOfOneCardObjectiveC
//
//  Created by Will morris on 5/21/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import UIKit

class DeckViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var suitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        updateViews()
    }
    
    func updateViews() {
        WAMCardController.fetchCard { (card) in
            DispatchQueue.main.async {
                guard let card = card else { return }
                self.fetchAndSetImage(for: card)
                self.suitLabel.text = card.suit
            }
        }
    }
    
    func fetchAndSetImage(for card: WAMCard) {
        WAMCardController.fetchImage(withUrlString: card.imageUrl) { (image) in
            DispatchQueue.main.async {
                guard let image = image else { return }
                self.cardImageView.image = image
            }
        }
    }
}
