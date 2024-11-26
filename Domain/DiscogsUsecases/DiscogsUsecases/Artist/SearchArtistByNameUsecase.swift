//
//  SearchArtistByNameUsecase.swift
//  DiscogsUsecases
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import DiscogsEntities
import DiscogsDataSource

public protocol SearchArtistByNameUsecaseType {
    func execute(name: String) async throws -> [ArtistSearch]
    func more() async throws -> [ArtistSearch]
}

public class SearchArtistByNameUsecase: SearchArtistByNameUsecaseType {
    
    private let dataSource: SearchArtistByNameRemoteDataSource
    private var page: Int = 1
    private var totalPages: Int = 0
    private var name: String = ""
    
    public init(dataSource: SearchArtistByNameRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(name: String) async throws -> [ArtistSearch] {
        let data = try await dataSource.execute(name: name, page: page)
        self.name = name
        totalPages = data.pagination?.total ?? 0
        return data.artists
    }
    
    public func more() async throws -> [ArtistSearch] {
        if page <= totalPages {
            page += 1
            return try await dataSource.execute(name: name, page: page).artists
        } else {
            return []
        }
    }
}
