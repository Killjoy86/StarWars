//
//  MainScreenTableViewController.swift
//  StarWars
//
//  Created by Roman Syrota on 03.05.2018.
//  Copyright © 2018 Roman Syrota. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainScreenTableViewController: UITableViewController {

    // MARK: - Properties

    var objects = [Object]()
    
    // MARK: - UIView methods

    override func viewDidLoad() {
        super.viewDidLoad()
        downLoadObjects()
    }

    // MARK: - Private methods
    
    private func downLoadObjects() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        ServerManager.shared.getAllObjects(name: "people", success: { (objects) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.objects = objects
            self.tableView.reloadData()
        }) { (statusCode, error) in
            self.downLoadObjects()
        }
    }

    private func configure(_ cell: ObjectTableViewCell, at indexPath: IndexPath) {
        let object = objects[indexPath.row]
        cell.nameLabel.text = object.name
        cell.birthYearLabel.text = object.birthYear
    
        if object.gender != .none {
            if object.gender == .male {
                cell.genderImageView.image = UIImage(named: "human-male")
                cell.genderImageView.image = cell.genderImageView.image?.withRenderingMode(.alwaysTemplate)
                cell.genderImageView.tintColor = UIColor(hex: 0x0059FF)
            } else if object.gender == .female {
                cell.genderImageView.image = UIImage(named: "human-female")
                cell.genderImageView.image = cell.genderImageView.image?.withRenderingMode(.alwaysTemplate)
                cell.genderImageView.tintColor = UIColor(hex: 0xE9008A)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectCell", for: indexPath) as! ObjectTableViewCell
        configure(cell, at: indexPath)
        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let detailsScreen = storyboard?.instantiateViewController(withIdentifier: "detailsScreen") as! DetailsScreenViewController

        detailsScreen.modalPresentationStyle = .overCurrentContext

        self.present(detailsScreen, animated: true, completion: nil)

        let object = objects[indexPath.row]

        detailsScreen.nameLabel.text = object.name
        detailsScreen.detailLabel.text = object.height + " | " + object.mass + " | " + object.gender.rawValue
        detailsScreen.filmsLabel.text = String(object.films.count)
        detailsScreen.starshipsLabel.text = String(object.starships.count)
        detailsScreen.vehiclesLabel.text = String(object.vehicles.count)
        detailsScreen.url = object.url
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}
