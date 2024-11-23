//
//  ContentViewModel.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import DiscogsUsecases
import DiscogsEntities
import DiscogsData

class ContentViewModel: ObservableObject {
    
    func testUseCase() {
        Task {
            do {
                let datsource = DiscogsDataRemoteDataSource.searchArtistByName
                let usecase = SearchArtistByNameUsecase(dataSource: datsource)
                let results = try await usecase.execute(name: "Luis Miguel")
                dump(results)
            } catch {
                dump(error)
            }
        }
    }
}
