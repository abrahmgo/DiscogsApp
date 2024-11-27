//
//  GetArtistByURLMock.swift
//  DiscogsUsecasesTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import DiscogsEntities
import DiscogsDataSource

struct GetArtistByURLMock: GetArtistByURLRemoteDataSource {
    
    func execute(url: String) async throws -> DiscogsEntities.ArtistInfo {
        let artist = ArtistInfo(id: 0, name: "", profile: "", releaseURL: "", images: [], members: [])
        return artist
    }
}
