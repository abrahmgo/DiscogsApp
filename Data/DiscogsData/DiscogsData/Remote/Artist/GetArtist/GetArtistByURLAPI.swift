//
//  GetArtistByURLAPI.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsDataSource
import DiscogsEntities
import NetworkCore

struct GetArtistByURLAPI: GetArtistByURLRemoteDataSource {
    
    private let service: NetworkServiceType
    
    init(service: NetworkServiceType) {
        self.service = service
    }
    
    func execute(url: String) async throws -> ArtistInfo {
        let model = GetArtistByURLRequestModel(url: url)
        let endpoint = GetArtistByURLEndpoint(model: model)
        let request: GetArtistByURLResponseModel = try await service.request(target: endpoint)
        return request.mapToArtist()
    }
}
