//
//  GetArtistByURLUsecaseTests.swift
//  DiscogsUsecasesTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import XCTest
@testable import DiscogsEntities
@testable import DiscogsUsecases
@testable import DiscogsDataSource

final class GetArtistByURLUsecaseTests: XCTestCase {

    var getArtistByURLUsecase: GetArtistByURLUsecaseType?
    
    override func setUpWithError() throws {
        let dataSource = GetArtistByURLMock()
        getArtistByURLUsecase = GetArtistByURLUsecase(dataSource: dataSource)
    }

    override func tearDownWithError() throws {
        getArtistByURLUsecase = nil
    }

    func testSearchArtistByNameUsecase() async throws {
        let data = try await getArtistByURLUsecase?.execute(url: "https://api.discogs.com/artists/1")
        XCTAssertNotNil(data)
    }
}
