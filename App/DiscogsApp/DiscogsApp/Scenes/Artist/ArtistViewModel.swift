//
//  ArtistViewModel.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsUI

class ArtistViewModel: ObservableObject {
    
    @Published var releases: [InfoDetailViewDataType] = []
    @Published var model: ArtistViewViewDataType = ArtistViewViewData(title: "", resume: "", coverImageURL: "")
    
    private let dependencies: ArtistDependencies
    
    init(dependencies: ArtistDependencies) {
        self.dependencies = dependencies
    }
    
    func setViewData() {
        Task {
            do {
                let artist = try await dependencies.infoArtist.execute(url: dependencies.artist.resourceUrl)
                let model = ArtistViewViewData(title: dependencies.artist.name,
                                               resume: artist.profile,
                                               coverImageURL: dependencies.artist.coverImage)
                await MainActor.run {
                    self.model = model
                }
            } catch {
                
            }
        }
    }
}

struct ArtistViewViewData: ArtistViewViewDataType {
    
    let title: String
    let resume: String
    let coverImageURL: String
}
