//
//  GetReleasesTests.swift
//  DiscogsDataTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import XCTest
@testable import DiscogsEntities
@testable import DiscogsData
@testable import DiscogsDataSource
@testable import NetworkCore


final class GetReleasesTests: XCTestCase {

    var getReleasesByURL: GetReleasesByURLRemoteDataSource?
    
    override func setUpWithError() throws {
        NetworkCoreAPI.setup(with: APIConfigMock.self)
        getReleasesByURL = DiscogsDataRemoteDataSource.getReleaseByURL
    }

    override func tearDownWithError() throws {
        getReleasesByURL = nil
    }

    func testGetArtistByURL() async throws {
        let artist = try await getReleasesByURL?.execute(url: "", sort: .format)
        XCTAssertNotNil(artist)
    }
}
