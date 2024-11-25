//
//  AppDelegate.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import UIKit
import NetworkCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        doNetwork()
        window = UIWindow()
        let viewController: UIViewController = SearchArtistCoordinator().start()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
    
    func doNetwork() {
        NetworkCoreAPI.setup(with: APIConfig.self)
    }
}

