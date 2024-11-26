//
//  ArtistMembers.swift
//  DiscogsEntities
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import Foundation

public struct ArtistMember {
    
    public let id: Int
    public let name: String
    public let url: String
    public let imageURL: String
    public let active: Bool
    
    public init(id: Int, name: String, url: String, imageURL: String, active: Bool) {
        self.id = id
        self.name = name
        self.url = url
        self.imageURL = imageURL
        self.active = active
    }
}
