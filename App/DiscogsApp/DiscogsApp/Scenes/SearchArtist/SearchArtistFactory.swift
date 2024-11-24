//
//  SearchArtistFactory.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import DiscogsUsecases
import DiscogsData
import DiscogsDataSource
import DiscogsEntities
import SwiftUI

struct SearchArtistFactory {
    
    static func build() -> SarchArtistView {
        
        let dataSource = DiscogsDataRemoteDataSource.searchArtistByName
        let searchArtist = SearchArtistByNameUsecase(dataSource: dataSource)
        let dependencies = SearchArtistViewModelDependencies(searchArtistByNameUsecase: searchArtist)
        let viewModel = SearchArtistViewModel(dependencies: dependencies)
        let view = SarchArtistView(viewModel: viewModel)
        return view
    }
}
