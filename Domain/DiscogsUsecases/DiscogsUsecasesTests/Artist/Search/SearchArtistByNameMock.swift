//
//  SearchArtistByNameMock.swift
//  DiscogsUsecasesTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import DiscogsEntities
import DiscogsDataSource

struct SearchArtistByNameMock: SearchArtistByNameRemoteDataSource {
    
    func execute(name: String, page: Int) async throws -> DiscogsEntities.ArtistSearchInfo {
        
        let artist = ArtistSearch(id: 1, name: "", thumb: "", coverImage: "", resourceUrl: "")
        return ArtistSearchInfo(artists: [artist])
    }
}
