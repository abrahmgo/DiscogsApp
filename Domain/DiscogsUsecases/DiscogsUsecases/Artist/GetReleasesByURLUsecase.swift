//
//  GetReleasesByURLUsecase.swift
//  DiscogsUsecases
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import DiscogsEntities
import DiscogsDataSource

public protocol GetReleasesByURLUsecaseType {
    func execute(url: String, sort: DiscogsTypeSort) async throws -> [ArtistRelease]
    func more() async throws -> [ArtistRelease]
}

public class GetReleasesByURLUsecase: GetReleasesByURLUsecaseType {
    
    private let dataSource: GetReleasesByURLRemoteDataSource
    private var page: Int = 1
    private var totalPages: Int = 0
    private var nextUrl: String?
    private var sort: DiscogsTypeSort = .year
    
    public init(dataSource: GetReleasesByURLRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(url: String, sort: DiscogsTypeSort = .year) async throws -> [ArtistRelease] {
        let data = try await dataSource.execute(url: url, sort: sort)
        totalPages = data.pagination?.total ?? 0
        nextUrl = data.pagination?.urls?.next
        self.sort = sort
        return data.releases
    }
    
    public func more() async throws -> [ArtistRelease] {
        if page <= totalPages, let url = nextUrl {
            page += 1
            let data = try await dataSource.execute(url: url, sort: sort)
            nextUrl = data.pagination?.urls?.next
            return data.releases
        } else {
            return []
        }
    }
}
