//
//  GetReleasesByURLResponseModel.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import NetworkCore

struct GetReleasesByURLResponseModel: Decodable {
    
    let releases: [GetReleasesResponseModel]
    let pagination: NetworkCorePagination
}

struct GetReleasesResponseModel: Decodable {
    
    let id: Int?
    let format: String?
    let label: String?
    let title: String?
    let year: Int?
    let thumb: String?
}
