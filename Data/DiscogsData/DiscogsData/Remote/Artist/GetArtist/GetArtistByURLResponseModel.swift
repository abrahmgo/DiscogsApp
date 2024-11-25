//
//  GetArtistByURLResponseModel.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import Foundation

struct GetArtistByURLResponseModel: Decodable {
    
    let name: String
    let id: Int
    let releases_url: String
    let images: [GetArtistByURLImageResponseModel]
    let profile: String
}

struct GetArtistByURLImageResponseModel: Decodable {
    
    let type: String
    let uri: String
}
