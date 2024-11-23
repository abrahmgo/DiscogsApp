//
//  SearchArtistByNameResponseModel.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//


struct SearchArtistByNameResponseModel: Decodable {
    
    let id: Int
    let type: String
    let title: String
    let thumb: String
    let cover_image: String
    let resource_url: String
}
