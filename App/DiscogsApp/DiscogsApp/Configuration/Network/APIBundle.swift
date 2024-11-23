//
//  APIBundle.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import Foundation

enum APIBundle: String {
    
    case production = "PRODUCTION"
    case development = "DEV"
    
    var server: String {
        switch self {
        case .production:
            return "https://api.discogs.com"
        case .development:
            return "https://api.discogs.com"
        }
    }
}
