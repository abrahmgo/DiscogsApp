//
//  APIConfig.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import NetworkCore

struct APIConfig: NetworkCoreAPIConfigType {

    static var language: String = ""

    static var baseURL: String {
        #if DEBUG

        guard let serverInUse = UserDefaults.standard.object(forKey: "ServerInUse") as? String else {
            return APIBundle.development.server
        }

        guard let bundleAPI = APIBundle(rawValue: serverInUse) else {
            return APIBundle.development.server
        }

        return bundleAPI.server

        #else
        return APIBundle.production.server

        #endif
    }

    static var useSampleData: Bool {
        guard let mocksInUse = UserDefaults.standard.object(forKey: "MocksInUse") as? String else {
            return false
        }
        
        return mocksInUse == "YES" ? true : false
    }

    static var additionalHeaders: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }

    static var token: String {
        return ""
    }
}
