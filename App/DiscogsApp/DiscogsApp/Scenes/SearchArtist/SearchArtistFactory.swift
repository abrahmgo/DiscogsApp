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
import UIKit

struct SearchArtistFactory {
    
    static func build(router: SearchArtistRouterType) -> UIViewController {
        let dataSource = DiscogsDataRemoteDataSource.searchArtistByName
        let searchArtist = SearchArtistByNameUsecase(dataSource: dataSource)
        let dependencies = SearchArtistViewModelDependencies(searchArtistByNameUsecase: searchArtist,
                                                             router: router)
        let viewModel = SearchArtistViewModel(dependencies: dependencies)
        let view = SarchArtistView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
