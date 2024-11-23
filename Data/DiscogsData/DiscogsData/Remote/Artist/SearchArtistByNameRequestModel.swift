//
//  SearchArtistByNameRequestModel.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import Foundation

struct SearchArtistByNameRequestModel {
    
    let page: Int
    let perPage: Int
    let name: String
}
