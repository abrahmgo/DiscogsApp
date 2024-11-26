//
//  GetReleasesByURLUsecase.swift
//  DiscogsUsecases
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import DiscogsEntities
import DiscogsDataSource

public protocol GetReleasesByURLUsecaseType {
    func execute(url: String) async throws -> [ArtistRelease]
    func more() async throws -> [ArtistRelease]
}

public class GetReleasesByURLUsecase: GetReleasesByURLUsecaseType {
    
    private let dataSource: GetReleasesByURLRemoteDataSource
    private var page: Int = 1
    private var totalPages: Int = 0
    private var nextUrl: String = ""
    
    public init(dataSource: GetReleasesByURLRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(url: String) async throws -> [ArtistRelease] {
        let data = try await dataSource.execute(url: url)
        totalPages = data.pagination.total
        nextUrl = data.pagination.urls.next
        return data.releases
    }
    
    public func more() async throws -> [ArtistRelease] {
        if page <= totalPages {
            page += 1
            let data = try await dataSource.execute(url: nextUrl)
            nextUrl = data.pagination.urls.next
            return data.releases
        } else {
            return []
        }
    }
}
