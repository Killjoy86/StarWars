//
//  Object.swift
//  StarWars
//
//  Created by Roman Syrota on 03.05.2018.
//  Copyright © 2018 Roman Syrota. All rights reserved.
//

import Foundation
import SwiftyJSON

class Object {

    // MARK: - Properties
    
    enum Gender: String {
        case none = "n/a"
        case male = "male"
        case female = "female"
    }
    
    var name: String!
    var height: String!
    var mass: String!
    var gender: Gender!
    var url: String!
    var birthYear: String!
    var films = [String]()
    var vehicles = [String]()
    var starships = [String]()

    // MARK: - Initializer

    init(responseJSON: JSON) {
        if let name = responseJSON["name"].string {
            self.name = name
        }
        if let height = responseJSON["height"].string {
            self.height = height
        }
        if let mass = responseJSON["mass"].string {
            self.mass = mass
        }
        if let gender = responseJSON["gender"].string {
            self.gender = Gender(rawValue: gender)
        }
        if let url = responseJSON["url"].string {
            self.url = url
        }
        if let birthYear = responseJSON["birth_year"].string {
            self.birthYear = birthYear
        }
        if let filmsJson = responseJSON["films"].array {
            for i in 0..<filmsJson.count {
                if let filmString = filmsJson[i].string {
                    films.append(filmString)
                }
            }
        }
        if let vehiclesJson = responseJSON["vehicles"].array {
            for i in 0..<vehiclesJson.count {
                if let vehiclesString = vehiclesJson[i].string {
                    vehicles.append(vehiclesString)
                }
            }
        }
        if let starshipsJson = responseJSON["starships"].array {
            for i in 0..<starshipsJson.count {
                if let starshipsString = starshipsJson[i].string {
                    starships.append(starshipsString)
                }
            }
        }
    }
}
