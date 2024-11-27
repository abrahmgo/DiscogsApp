//
//  GetArtistTests.swift
//  DiscogsDataTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import XCTest
@testable import DiscogsEntities
@testable import DiscogsData
@testable import DiscogsDataSource
@testable import NetworkCore

final class GetArtistTests: XCTestCase {

    var getArtistByURLAPI: GetArtistByURLRemoteDataSource?
    
    override func setUpWithError() throws {
        NetworkCoreAPI.setup(with: APIConfigMock.self)
        getArtistByURLAPI = DiscogsDataRemoteDataSource.getArtistByURL
    }

    override func tearDownWithError() throws {
        getArtistByURLAPI = nil
    }

    func testGetArtistByURL() async throws {
        let artist = try await getArtistByURLAPI?.execute(url: "https://api.discogs.com/artists/1")
        XCTAssertNotNil(artist)
    }
}
