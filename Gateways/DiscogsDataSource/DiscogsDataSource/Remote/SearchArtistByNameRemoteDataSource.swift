//
//  SearchArtistByNameRemoteDataSource.swift
//  DiscogsDataSource
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import DiscogsEntities

public protocol SearchArtistByNameRemoteDataSource {
    func execute(name: String) async throws -> ArtistSearchInfo
}
