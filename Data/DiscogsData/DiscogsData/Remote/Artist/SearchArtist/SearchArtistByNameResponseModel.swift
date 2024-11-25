//
//  SearchArtistByNameResponseModel.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import NetworkCore

struct SearchArtistByNameResponseModel: Decodable {
    
    let results: [SearchArtistByNameResultsResponseModel]
    let pagination: NetworkCorePagination
}


struct SearchArtistByNameResultsResponseModel: Decodable {
    
    let id: Int
    let type: String
    let title: String
    let thumb: String
    let cover_image: String
    let resource_url: String
}
