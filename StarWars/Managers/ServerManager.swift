//
//  ServerManager.swift
//  StarWars
//
//  Created by Roman Syrota on 03.05.2018.
//  Copyright © 2018 Roman Syrota. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ServerManager: NSObject {
    
    // MARK: - Properties

    static let shared = ServerManager()
    var sessionManager: SessionManager!
    let baseURL = "https://swapi.co/api/"
    
    //MARK: - Requests

    func getAllObjects(name: String,
                       success: @escaping (_ objects: [Object]) -> (),
                       failure: @escaping (_ statusCode: Int?, _ error: Error?) -> ()) {
        sessionManager = SessionManager(configuration: .default)
        sessionManager.session.configuration.timeoutIntervalForRequest = 3000

        guard let url = URL(string: baseURL + name) else { return }
        sessionManager.request(url, method: .get, parameters: nil).responseJSON { (response) in

            switch response.result {
            case .success:
                let responseJSON = JSON(response.data!)
                guard let jsonResultArray = responseJSON["results"].array else { return }
                var objects = [Object]()
                for i in 0..<jsonResultArray.count {
                    objects.append(Object(responseJSON: jsonResultArray[i]))
                }
                
                success(objects)
            case .failure(let error):
                let statusCode = response.response?.statusCode
                failure(statusCode, error)
            }
        }
    }

    func loadSplashScreen(url: URL,
                          success: @escaping (_ image: UIImage) -> (),
                          failure: @escaping (_ statusCode: Int?, _ error: Error?) -> ()) {
        sessionManager = SessionManager(configuration: .default)
        sessionManager.session.configuration.timeoutIntervalForRequest = 3000

        sessionManager.request(url, method: .get, parameters: nil).responseData { (imageData) in
            switch imageData.result {
            case .success:
                
                guard let image = UIImage(data: imageData.data!) else { return }
                success(image)
                
            case .failure(let error):
                let statusCode = imageData.response?.statusCode
                failure(statusCode, error)
            }
        }
    }
}
