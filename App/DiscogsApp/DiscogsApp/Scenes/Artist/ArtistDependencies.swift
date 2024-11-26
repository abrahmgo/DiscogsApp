//
//  ArtistDependencies.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities
import DiscogsUsecases

struct ArtistDependencies {
    
    let artist: ArtistSearch
    let infoArtist: GetArtistByURLUsecaseType
    let getReleases: GetReleasesByURLUsecaseType
}
