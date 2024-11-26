//
//  RelesesDependencies.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import DiscogsEntities
import DiscogsUsecases

struct RelesesDependencies {
    
    let releasesURL: String
    let getReleases: GetReleasesByURLUsecaseType
}

