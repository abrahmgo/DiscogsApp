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
    
    static func build(artist: ArtistSearch) -> UIViewController {
        let dataSource = DiscogsDataRemoteDataSource.getArtistByURL
        let getArtist = GetArtistByURLUsecase(dataSource: dataSource)
        let dependencies = ArtistDependencies(artist: artist,
                                              infoArtist: getArtist)
        let viewModel = ArtistViewModel(dependencies: dependencies)
        let view = ArtistView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
    
    static func buildSU(artist: ArtistSearch) -> some View{
        let dataSource = DiscogsDataRemoteDataSource.getArtistByURL
        let getArtist = GetArtistByURLUsecase(dataSource: dataSource)
        let dependencies = ArtistDependencies(artist: artist,
                                              infoArtist: getArtist)
        let viewModel = ArtistViewModel(dependencies: dependencies)
        let view = ArtistView(viewModel: viewModel)
        return view
    }
}
