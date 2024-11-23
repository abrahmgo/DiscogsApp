//
//  SearchArtistByNameUsecase.swift
//  DiscogsUsecases
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import DiscogsEntities
import DiscogsDataSource

public protocol SearchArtistByNameUsecaseType {
    func execute(name: String) async throws -> ArtistSearchInfo
}

public struct SearchArtistByNameUsecase: SearchArtistByNameUsecaseType {
    
    private let dataSource: SearchArtistByNameRemoteDataSource
    
    public init(dataSource: SearchArtistByNameRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(name: String) async throws -> ArtistSearchInfo {
        try await dataSource.execute(name: name)
    }
}
