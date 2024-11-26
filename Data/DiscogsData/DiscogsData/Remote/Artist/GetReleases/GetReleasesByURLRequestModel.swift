//
//  GetReleasesByURLRequestModel.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities

struct GetReleasesByURLRequestModel {
    let url: String
    let sort: DiscogsTypeSort
}
