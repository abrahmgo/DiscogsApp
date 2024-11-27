//
//  SearchArtistTests.swift
//  DiscogsDataTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import XCTest
@testable import DiscogsEntities
@testable import DiscogsData
@testable import DiscogsDataSource
@testable import NetworkCore


final class SearchArtistTests: XCTestCase {

    var searchArtistByName: SearchArtistByNameRemoteDataSource?
    
    override func setUpWithError() throws {
        NetworkCoreAPI.setup(with: APIConfigMock.self)
        searchArtistByName = DiscogsDataRemoteDataSource.searchArtistByName
    }

    override func tearDownWithError() throws {
        searchArtistByName = nil
    }

    func testGetArtistByURL() async throws {
        let artist = try await searchArtistByName?.execute(name: "The Beatles", page: 1)
        XCTAssertNotNil(artist)
    }
}
