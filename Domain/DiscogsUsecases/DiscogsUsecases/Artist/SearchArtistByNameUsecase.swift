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

public class SearchArtistByNameUsecase: SearchArtistByNameUsecaseType {
    
    private let dataSource: SearchArtistByNameRemoteDataSource
    private var page: Int = 0
    
    public init(dataSource: SearchArtistByNameRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(name: String) async throws -> ArtistSearchInfo {
        page += 1
        return try await dataSource.execute(name: name, page: page)
    }
}
