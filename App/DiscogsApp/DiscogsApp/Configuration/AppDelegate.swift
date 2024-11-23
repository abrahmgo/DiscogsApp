//
//  AppDelegate.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import NetworkCore
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        doNetwork()
        return true
    }
    
    func doNetwork() {
        NetworkCoreAPI.setup(with: APIConfig.self)
    }
}
