//
//  SearchArtistByNameEndpoint.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import NetworkCore

struct SearchArtistByNameEndpoint: NetworkTargetType {
    
    private let model: SearchArtistByNameRequestModel
    
    init(model: SearchArtistByNameRequestModel) {
        self.model = model
    }
    
    var baseURL: String {
        return ""
    }
    
    var path: String {
        return "/database/search"
    }
    
    var method: NetworkCore.NetworkMethod {
        return .GET
    }
    
    var body: Data?
    
    var queryParams: [String : Any]? {
        return ["query": model.name,
                "type": "artist",
                "page": model.page,
                "per_page": model.perPage]
    }
    
    var headers: [String : String]?
    
    var sampleData: Data? {
        return nil
    }
}
