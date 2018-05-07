//
//  SplashScreenViewController.swift
//  StarWars
//
//  Created by Roman Syrota on 04.05.2018.
//  Copyright © 2018 Roman Syrota. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    // MARK: - Properties

    var splashUrl = "https://cdn.iconscout.com/public/images/icon/free/png-512/star-wars-logo-tv-show-series-31ebf3d1fc35cf6a-512x512.png"
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - UView methods

    override func viewDidLoad() {
        super.viewDidLoad()

        downLoadSplashScreen()
    }
    
    // MARK: - Private methods
    
    private func downLoadSplashScreen() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let url = URL(string: splashUrl) else { return }
        ServerManager.shared.loadSplashScreen(url: url, success: { [unowned self] (image) in
            self.imageView.image = image
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") else { return }
                mainVC.modalTransitionStyle = .crossDissolve
                self.present(mainVC, animated: true)
            }
        }) { (statusCode, error) in
            self.downLoadSplashScreen()
        }
    }
}
