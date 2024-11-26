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
                
                let releasesInfo = try await dependencies.getReleases.execute(url: artist.releaseURL)
                let releases = releasesInfo.map({InfoDetailViewData(title: $0.title,
                                                                    subtitle: $0.subtilte,
                                                                    subtitle2: $0.format,
                                                                    subtitle3: "\($0.year)",
                                                                    urlImage: $0.imageURL)})
                await MainActor.run {
                    self.releases = releases
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
