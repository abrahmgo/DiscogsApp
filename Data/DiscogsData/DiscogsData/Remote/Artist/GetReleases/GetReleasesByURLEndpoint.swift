//
//  GetReleasesByURLEndpoint.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import NetworkCore

struct GetReleasesByURLEndpoint: NetworkTargetType {
    
    private let model: GetReleasesByURLRequestModel
    
    init(model: GetReleasesByURLRequestModel) {
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
        return ["per_page": 30,
                "sort": model.sort.rawValue,
                "sort_order": "desc"]
    }
    
    var headers: [String: String]?
    
    var sampleData: Data? {
        let bundle = DiscogsDataRemoteDataSource.bundle
        let sampleData = NetworkCoreSampleData(bundle: bundle)
        
        return sampleData.getData(for: "GetReleasesExample")
    }
}
