//
//  ReleasesFactory.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import DiscogsUsecases
import DiscogsData
import DiscogsDataSource
import DiscogsEntities
import SwiftUI
import UIKit

struct ReleasesFactory {
    
    static func build(releasesURL: String) -> UIViewController {
        let view = buildSU(releasesURL: releasesURL)
        return UIHostingController(rootView: view)
    }
    
    static func buildSU(releasesURL: String) -> some View {
        let dataSource2 = DiscogsDataRemoteDataSource.getReleaseByURL
        
        let getReleases = GetReleasesByURLUsecase(dataSource: dataSource2)
        let dependencies = RelesesDependencies(releasesURL: releasesURL,
                                               getReleases: getReleases)
        let viewModel = ReleasesViewModel(dependencies: dependencies)
        let view = ReleasesView(viewModel: viewModel)
        return view
    }
}
