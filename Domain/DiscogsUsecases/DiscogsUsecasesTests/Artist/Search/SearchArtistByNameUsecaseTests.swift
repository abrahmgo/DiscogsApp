//
//  SearchArtistByNameUsecaseTests.swift
//  DiscogsUsecasesTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import XCTest
@testable import DiscogsEntities
@testable import DiscogsUsecases
@testable import DiscogsDataSource

final class SearchArtistByNameUsecaseTests: XCTestCase {

    var searchArtistByNameUsecase: SearchArtistByNameUsecaseType?
    
    override func setUpWithError() throws {
        let dataSource = SearchArtistByNameMock()
        searchArtistByNameUsecase = SearchArtistByNameUsecase(dataSource: dataSource)
    }

    override func tearDownWithError() throws {
        searchArtistByNameUsecase = nil
    }

    func testSearchArtistByNameUsecase() async throws {
        let data = try await searchArtistByNameUsecase?.execute(name: "")
        XCTAssertNotNil(data)
    }
    
    func testSearchArtistByNameUsecasePagination() async throws {
        let data = try await searchArtistByNameUsecase?.more()
        XCTAssertNotNil(data)
    }
}
