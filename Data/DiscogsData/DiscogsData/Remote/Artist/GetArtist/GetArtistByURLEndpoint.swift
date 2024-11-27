//
//  GetArtistByURLEndpoint.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import NetworkCore

struct GetArtistByURLEndpoint: NetworkTargetType {
    
    private let model: GetArtistByURLRequestModel
    
    init(model: GetArtistByURLRequestModel) {
        self.model = model
    }
    
    var baseURL: String {
        return model.url
    }
    
    var path: String {
        return ""
    }
    
    var method: NetworkCore.NetworkMethod {
        return .GET
    }
    
    var body: Data?
    
    var queryParams: [String: Any]? {
        return nil
    }
    
    var headers: [String: String]?
    
    var sampleData: Data? {
        let bundle = DiscogsDataRemoteDataSource.bundle
        let sampleData = NetworkCoreSampleData(bundle: bundle)
        
        return sampleData.getData(for: "GetArtistExample")
    }
}
