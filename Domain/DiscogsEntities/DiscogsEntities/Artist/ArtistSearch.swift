//
//  ArtistSearch.swift
//  DiscogsEntities
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import Foundation

public struct ArtistSearch: Identifiable {
    
    public let id: Int
    public let name: String
    public let thumb: String
    public let coverImage: String
    public let resourceUrl: String
    
    public init(id: Int, name: String, thumb: String, coverImage: String, resourceUrl: String) {
        self.id = id
        self.name = name
        self.thumb = thumb
        self.coverImage = coverImage
        self.resourceUrl = resourceUrl
    }
}

public struct ArtistSearchInfo {
    
    public let artists: [ArtistSearch]
    public let pagination: Pagination
    
    public init(artists: [ArtistSearch], pagination: Pagination) {
        self.artists = artists
        self.pagination = pagination
    }
}
