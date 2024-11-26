//
//  ArtistFactory.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsUsecases
import DiscogsData
import DiscogsDataSource
import DiscogsEntities
import SwiftUI
import UIKit

struct ArtistFactory {
    
    static func build(artist: ArtistSearch, router: ArtistRouterType) -> UIViewController {
        let view = buildSU(artist: artist, router: router)
        return UIHostingController(rootView: view)
    }
    
    static func buildSU(artist: ArtistSearch, router: ArtistRouterType? = nil) -> some View {
        let dataSource = DiscogsDataRemoteDataSource.getArtistByURL
        let dataSource2 = DiscogsDataRemoteDataSource.getReleaseByURL
        
        let getArtist = GetArtistByURLUsecase(dataSource: dataSource)
        let getReleases = GetReleasesByURLUsecase(dataSource: dataSource2)
        let dependencies = ArtistDependencies(artist: artist,
                                              infoArtist: getArtist,
                                              getReleases: getReleases,
                                              router: router)
        let viewModel = ArtistViewModel(dependencies: dependencies)
        let view = ArtistView(viewModel: viewModel)
        return view
    }
}
