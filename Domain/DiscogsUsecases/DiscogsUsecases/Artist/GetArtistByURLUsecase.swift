//
//  GetArtistByURLUsecase.swift
//  DiscogsUsecases
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities
import DiscogsDataSource

public protocol GetArtistByURLUsecaseType {
    func execute(url: String) async throws -> ArtistInfo
}

public struct GetArtistByURLUsecase: GetArtistByURLUsecaseType {
    
    private let dataSource: GetArtistByURLRemoteDataSource
    
    public init(dataSource: GetArtistByURLRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(url: String) async throws -> ArtistInfo {
        try await dataSource.execute(url: url)
    }
}
