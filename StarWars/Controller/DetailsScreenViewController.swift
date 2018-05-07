//
//  DetailsScreenViewController.swift
//  StarWars
//
//  Created by Roman Syrota on 03.05.2018.
//  Copyright © 2018 Roman Syrota. All rights reserved.
//

import UIKit

class DetailsScreenViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var starshipsLabel: UILabel!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var vehiclesLabel: UILabel!
    @IBOutlet weak var openBrowserButton: UIButton!
    
    var url: String!
    
    // MARK: - Actions

    @IBAction func closeAction(_ sender: UIButton) {
        view.backgroundColor = UIColor.black.withAlphaComponent(0)
        self.dismiss(animated: true)
    }

    @IBAction func openBrowserAction(_ sender: UIButton) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    // MARK: - UIView methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.openBrowserButton.layer.cornerRadius = self.openBrowserButton.frame.height / 2
        self.openBrowserButton.layer.borderWidth = 2
        self.openBrowserButton.layer.borderColor = UIColor(hex: 0xF22121).cgColor
        view.backgroundColor = UIColor.black.withAlphaComponent(0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            UIView.animate(withDuration: 0.15, animations: {
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            })
        }
    }
}
