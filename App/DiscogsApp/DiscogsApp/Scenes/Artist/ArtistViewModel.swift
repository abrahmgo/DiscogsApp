//
//  ArtistViewModel.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsUI
import DiscogsEntities

class ArtistViewModel: ObservableObject {
    
    @Published var releases: [InfoDetailViewDataType] = []
    @Published var model: ArtistViewViewDataType = ArtistViewViewData(title: "", resume: "", coverImageURL: "")
    @Published var membersTitle: String = ""
    @Published var members: [InfoDetailViewDataType] = []
    
    private let dependencies: ArtistDependencies
    private var releasesURL: String = ""
    
    
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
                releasesURL = artist.releaseURL
                await MainActor.run {
                    self.model = model
                }
                await setMembers(members: artist.members)
            } catch {
                
            }
        }
    }
    
    func goToReleases() {
        if !releasesURL.isEmpty {
            dependencies.router?.goToReleases(url: releasesURL)
        }
    }
    
    func setMembers(members: [ArtistMember]) async {
        guard !members.isEmpty else {
            return
        }
        let activeMembers = members.filter({$0.active})
        let data = activeMembers.map({InfoDetailViewData(id: $0.id,
                                                         title: $0.name,
                                                         subtitle: "", subtitle2: "",
                                                         subtitle3: "", urlImage: $0.imageURL)})
        await MainActor.run {
            self.membersTitle = "Members"
            self.members = data
        }
    }
}

struct ArtistViewViewData: ArtistViewViewDataType {
    
    let title: String
    let resume: String
    let coverImageURL: String
}
