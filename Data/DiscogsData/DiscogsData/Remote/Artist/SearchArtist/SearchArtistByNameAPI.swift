//
//  SearchArtistByNameAPI.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import DiscogsDataSource
import DiscogsEntities
import NetworkCore

struct SearchArtistByNameAPI: SearchArtistByNameRemoteDataSource {
    
    private let service: NetworkServiceType
    
    init(service: NetworkServiceType) {
        self.service = service
    }
    
    func execute(name: String, page: Int) async throws -> DiscogsEntities.ArtistSearchInfo {
        let model: SearchArtistByNameRequestModel = SearchArtistByNameRequestModel(page: page,
                                                                                   name: name)
        let endpoint: SearchArtistByNameEndpoint = SearchArtistByNameEndpoint(model: model)
        let request: SearchArtistByNameResponseModel = try await service.request(target: endpoint)
        
        guard !request.results.isEmpty else {
            throw DiscogsError.withoutResults
        }
        
        let result = ArtistSearchInfo(artists: request.results.map {$0.mapToSearchArtist()},
                                      pagination: request.pagination?.mapToPagination())
        return result
    }
}
