//
//  GetReleasesByURLMock.swift
//  DiscogsUsecasesTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import DiscogsEntities
import DiscogsDataSource

struct GetReleasesByURLMock: GetReleasesByURLRemoteDataSource {
    
    func execute(url: String, sort: DiscogsEntities.DiscogsTypeSort) async throws -> DiscogsEntities.ArtistReleaseInfo {
        
        let release = ArtistRelease(format: "", id: 0, title: "", subtilte: "", imageURL: "", year: 0)
        let data = ArtistReleaseInfo(releases: [release])
        return data
    }
}
