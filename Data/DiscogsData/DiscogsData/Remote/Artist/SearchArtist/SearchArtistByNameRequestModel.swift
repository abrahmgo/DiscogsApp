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
    
    init(page: Int, perPage: Int = 30, name: String) {
        self.page = page
        self.perPage = perPage
        self.name = name
    }
}
