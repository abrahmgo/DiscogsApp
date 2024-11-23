//
//  ArtistInfo.swift
//  DiscogsEntities
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import Foundation

public struct ArtistInfo {
    
    public let id: Int
    public let name: String
    public let realName: String
    public let profile: String
    public let releases: String
    public let urls: [String]
    
    public init(id: Int, name: String, realName: String, profile: String, releases: String, urls: [String]) {
        self.id = id
        self.name = name
        self.realName = realName
        self.profile = profile
        self.releases = releases
        self.urls = urls
    }
}
