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
    public let profile: String
    public let releaseURL: String
    public let images: [AtistImage]
    public let members: [ArtistMember]
    
    public init(id: Int,
                name: String,
                profile: String,
                releaseURL: String,
                images: [AtistImage],
                members: [ArtistMember]) {
        self.id = id
        self.name = name
        self.profile = profile
        self.releaseURL = releaseURL
        self.images = images
        self.members = members
    }
}

public struct AtistImage {
    
    public let type: DiscogsType
    public let url: String
    
    public init(type: DiscogsType, url: String) {
        self.type = type
        self.url = url
    }
}

public enum DiscogsType: String {
    case primary
    case senconday
    case unknown
}
