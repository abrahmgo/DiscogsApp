//
//  GetReleasesByURLAPI.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities
import DiscogsDataSource
import NetworkCore

struct GetReleasesByURLAPI: GetReleasesByURLRemoteDataSource {
    
    private let service: NetworkServiceType
    
    init(service: NetworkServiceType) {
        self.service = service
    }
    
    func execute(url: String) async throws -> ArtistReleaseInfo {
        let model = GetReleasesByURLRequestModel(url: url)
        let endpoint = GetReleasesByURLEndpoint(model: model)
        let request: GetReleasesByURLResponseModel = try await service.request(target: endpoint)
        
        guard !request.releases.isEmpty else {
            throw DiscogsError.withoutResults
        }
        
        let result = ArtistReleaseInfo(releases: request.releases.map{$0.mapToRelease()},
                                      pagination: request.pagination.mapToPagination())
        return result
    }
}
