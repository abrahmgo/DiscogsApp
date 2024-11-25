//
//  GetArtistByURLRemoteDataSource.swift
//  DiscogsDataSource
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities

public protocol GetArtistByURLRemoteDataSource {
    func execute(url: String) async throws -> ArtistInfo
}
