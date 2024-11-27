//
//  SearchArtistViewModel.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import DiscogsEntities
import DiscogsUI

protocol SearchArtistViewModelType {
    func searchArtist(name: String)
    func setDefault()
    func moreArtist()
    func goToArtist(id: String)
}

class SearchArtistViewModel: SearchArtistViewModelType, ObservableObject {
    
    @Published var artists: [ImageTitleViewDataType] = []
    @Published var searchText: String = ""
    
    private var isSearching: Bool = false
    private var artistSearch: [ArtistSearch] = []
    private let dependencies: SearchArtistViewModelDependencies
    
    init(dependencies: SearchArtistViewModelDependencies) {
        self.dependencies = dependencies
    }
    
    func searchArtist(name: String) {
        Task {
            do {
                guard !isSearching else {
                    return
                }
                isSearching = true
                let results = try await dependencies.searchArtistByNameUsecase.execute(name: name)
                let artists = results.map {ImageTitleViewData(id: "\($0.id)",
                                                              title: $0.name,
                                                              urlImage: $0.thumb)}
                artistSearch += results
                await MainActor.run {
                    self.artists.removeAll()
                    self.artists = artists
                }
                try await Task.sleep(nanoseconds: UInt64(1 * 1_000_000_000))
                isSearching = false
            } catch {
                isSearching = false
                dump(error)
            }
        }
    }
    
    func moreArtist() {
        Task {
            do {
                let results = try await dependencies.searchArtistByNameUsecase.more()
                artistSearch += results
                let artists = results.map { ImageTitleViewData(id: "\($0.id)",
                                                               title: $0.name,
                                                               urlImage: $0.thumb)}
                await MainActor.run {
                    self.artists += artists
                }
            } catch { }
        }
    }
    
    func setDefault() {
        artists.removeAll()
        artistSearch.removeAll()
        let data = ImageTitleViewData(id: "", title: "Search some artist", urlImage: DiscogsConstants.defaultImage)
        self.artists = [data]
    }
    
    func goToArtist(id: String) {
        guard let artist = self.artistSearch.first(where: { "\($0.id)" == id }) else {
            return
        }
        return dependencies.router.goToArtistDetail(with: artist)
    }
}
