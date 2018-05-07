//
//  ObjectTableViewCell.swift
//  StarWars
//
//  Created by Roman Syrota on 03.05.2018.
//  Copyright © 2018 Roman Syrota. All rights reserved.
//

import UIKit

class ObjectTableViewCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    // MARK: - awakeFromNib

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.view.layer.cornerRadius = 5
        
        self.view.layer.masksToBounds = false
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 0.8
        self.view.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.view.layer.shadowRadius = 1

    }
}
