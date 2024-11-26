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
                await setDefault(text: "Loading...")
                let releasesInfo = try await dependencies.getReleases.execute(url: dependencies.releasesURL,
                                                                              sort: .year)
                artistReleases.removeAll()
                artistReleases += releasesInfo
                await formatData(releasesInfo: releasesInfo)
                
            } catch {
                await setDefault(text: "Without results")
            }
        }
    }
    
    func sortYear() {
        Task {
            do {
                await setDefault(text: "Loading...")
                let releasesInfo = try await dependencies.getReleases.execute(url: dependencies.releasesURL,
                                                                              sort: .year)
                artistReleases.removeAll()
                artistReleases += releasesInfo
                await formatData(releasesInfo: releasesInfo)
                
            } catch {
                await setDefault(text: "Without results")
            }
        }
    }
    
    func sortTitle() {
        Task {
            do {
                await setDefault(text: "Loading...")
                let releasesInfo = try await dependencies.getReleases.execute(url: dependencies.releasesURL,
                                                                              sort: .title)
                artistReleases.removeAll()
                artistReleases += releasesInfo
                await formatData(releasesInfo: releasesInfo)
                
            } catch {
                await setDefault(text: "Without results")
            }
        }
    }
    
    func sortFormat() {
        Task {
            do {
                await setDefault(text: "Loading...")
                let releasesInfo = try await dependencies.getReleases.execute(url: dependencies.releasesURL,
                                                                              sort: .format)
                artistReleases.removeAll()
                artistReleases += releasesInfo
                await formatData(releasesInfo: releasesInfo)
                
            } catch {
                await setDefault(text: "Without results")
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
                await setDefault(text: "Without results")
            }
        }
    }
    
    func setDefault(text: String) async {
        let data = InfoDetailViewData(id: 0, title: text, subtitle: "", subtitle2: "", subtitle3: "", urlImage: DiscogsConstants.defaultImage)
        await MainActor.run {
            self.releases = [data]
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
