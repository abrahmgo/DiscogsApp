//
//  SearchViewModelDependencies.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import DiscogsUsecases

struct SearchArtistViewModelDependencies {
    
    let searchArtistByNameUsecase: SearchArtistByNameUsecaseType
    let router: SearchArtistRouterType
}
