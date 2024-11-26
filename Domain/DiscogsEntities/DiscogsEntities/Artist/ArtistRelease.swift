//
//  ArtistRelease.swift
//  DiscogsEntities
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import Foundation

public struct ArtistReleaseInfo {
    
    public let releases: [ArtistRelease]
    public let pagination: Pagination
    
    public init(releases: [ArtistRelease], pagination: Pagination) {
        self.releases = releases
        self.pagination = pagination
    }
}

public struct ArtistRelease {
    
    public let format: String
    public let id: Int
    public let title: String
    public let subtilte: String
    public let imageURL: String
    public let year: Int
    
    public init(format: String, id: Int, title: String,
                subtilte: String, imageURL: String, year: Int) {
        self.format = format
        self.id = id
        self.title = title
        self.subtilte = subtilte
        self.imageURL = imageURL
        self.year = year
    }
}
