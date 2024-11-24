//
//  SearchArtistViewModel.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import DiscogsUsecases
import DiscogsEntities
import DiscogsData
import DiscogsUI

protocol SearchArtistViewModelType {
    func searchArtist(name: String)
    func setFavorites()
    func moreArtist()
}

class SearchArtistViewModel: SearchArtistViewModelType, ObservableObject {
    
    @Published var artists: [ImageTitleViewDataType] = []
    @Published var searchText: String = ""
    
    private let dependencies: SearchArtistViewModelDependencies
    
    init(dependencies: SearchArtistViewModelDependencies) {
        self.dependencies = dependencies
    }
    
    func searchArtist(name: String) {
        Task {
            do {
                try await Task.sleep(nanoseconds: UInt64(1 * 1_000_000_000))
                let results = try await dependencies.searchArtistByNameUsecase.execute(name: "Luis Miguel")
                let artists = results.map{ ImageTitleViewData(id: "\($0.id)",
                                                              title: $0.name,
                                                              urlImage: $0.thumb)}
                await MainActor.run {
                    self.artists = artists
                }
            } catch {
                dump(error)
            }
        }
    }
    
    func moreArtist() {
        Task {
            do {
                let results = try await dependencies.searchArtistByNameUsecase.more()
                let artists = results.map{ ImageTitleViewData(id: "\($0.id)",
                                                              title: $0.name,
                                                              urlImage: $0.thumb)}
                await MainActor.run {
                    self.artists += artists
                }
            } catch {
                
            }
        }
    }
    
    func setFavorites() {
        artists = []
    }
}
