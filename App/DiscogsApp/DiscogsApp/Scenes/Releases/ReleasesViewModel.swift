//
//  ReleasesViewModel.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import DiscogsEntities
import DiscogsUI

class ReleasesViewModel: ObservableObject {
    
    @Published var releases: [InfoDetailViewDataType] = []
    
    private let dependencies: RelesesDependencies
    private var artistReleases: [ArtistRelease] = []
    
    init(dependencies: RelesesDependencies) {
        self.dependencies = dependencies
    }
    
    func setViewData() {
        Task {
            do {
                let releasesInfo = try await dependencies.getReleases.execute(url: dependencies.releasesURL,
                                                                              sort: .year)
                artistReleases += releasesInfo
                await formatData(releasesInfo: releasesInfo)
                
            } catch {
                
            }
        }
    }
    
    func sortYear() {
        Task {
            do {
                artistReleases = []
                let releasesInfo = try await dependencies.getReleases.execute(url: dependencies.releasesURL,
                                                                              sort: .year)
                artistReleases += releasesInfo
                await formatData(releasesInfo: releasesInfo)
                
            } catch {
                
            }
        }
    }
    
    func sortTitle() {
        Task {
            do {
                artistReleases = []
                let releasesInfo = try await dependencies.getReleases.execute(url: dependencies.releasesURL,
                                                                              sort: .title)
                artistReleases += releasesInfo
                await formatData(releasesInfo: releasesInfo)
                
            } catch {
                
            }
        }
    }
    
    func sortFormat() {
        Task {
            do {
                artistReleases = []
                let releasesInfo = try await dependencies.getReleases.execute(url: dependencies.releasesURL,
                                                                              sort: .format)
                artistReleases += releasesInfo
                await formatData(releasesInfo: releasesInfo)
                
            } catch {
                
            }
        }
    }
    
    func more() {
        Task {
            do {
                let results = try await dependencies.getReleases.more()
                artistReleases += results
                await formatData(releasesInfo: artistReleases)
            } catch {
                
            }
        }
    }
    
    
    private func formatData(releasesInfo: [ArtistRelease]) async {
        let infoSorted = releasesInfo.sorted { $0.year > $1.year }
        let releases = infoSorted.map({InfoDetailViewData(id: $0.id,
                                                          title: $0.title,
                                                          subtitle: $0.subtilte,
                                                          subtitle2: $0.format,
                                                          subtitle3: "\($0.year)",
                                                          urlImage: $0.imageURL)})
        
        await MainActor.run {
            self.releases = releases
        }
    }
}
