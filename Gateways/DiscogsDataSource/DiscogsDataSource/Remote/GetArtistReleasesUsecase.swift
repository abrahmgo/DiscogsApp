//
//  GetArtistReleasesUsecase.swift
//  DiscogsDataSource
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities

public protocol GetReleasesByURLRemoteDataSource {
    func execute(url: String, sort: DiscogsTypeSort) async throws -> ArtistReleaseInfo
}
