//
//  GetArtistByURLResponseModel.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//
// swiftlint:disable identifier_name

import Foundation

struct GetArtistByURLResponseModel: Decodable {
    
    let name: String
    let id: Int
    let releases_url: String
    let images: [GetArtistByURLImageResponseModel]
    let members: [GetArtistByURLMembersResponseModel]?
    let profile: String
}

struct GetArtistByURLImageResponseModel: Decodable {
    
    let type: String
    let uri: String
}

struct GetArtistByURLMembersResponseModel: Decodable {
    
    let id: Int
    let name: String
    let resource_url: String
    let active: Bool
    let thumbnail_url: String
}

// swiftlint:enable identifier_name
