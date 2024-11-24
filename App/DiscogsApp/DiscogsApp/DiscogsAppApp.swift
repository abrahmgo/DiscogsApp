//
//  DiscogsAppApp.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import SwiftUI

@main
struct DiscogsAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SearchArtistFactory.build()
        }
    }
}
