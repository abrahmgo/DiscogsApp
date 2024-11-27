//
//  GetReleasesByURLUsecaseTests.swift
//  DiscogsUsecasesTests
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import XCTest
@testable import DiscogsEntities
@testable import DiscogsUsecases
@testable import DiscogsDataSource

final class GetReleasesByURLUsecaseTests: XCTestCase {

    var getReleasesByURLUsecase: GetReleasesByURLUsecaseType?
    
    override func setUpWithError() throws {
        let dataSource = GetReleasesByURLMock()
        getReleasesByURLUsecase = GetReleasesByURLUsecase(dataSource: dataSource)
    }

    override func tearDownWithError() throws {
        getReleasesByURLUsecase = nil
    }

    func testSearchArtistByNameUsecase() async throws {
        let data = try await getReleasesByURLUsecase?.execute(url: "", sort: .format)
        XCTAssertNotNil(data)
    }
    
    func testSearchArtistByNameUsecasePagination() async throws {
        let data = try await getReleasesByURLUsecase?.more()
        XCTAssertNotNil(data)
    }
}
