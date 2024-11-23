//
//  DiscogsDataRemoteDataSource.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import DiscogsDataSource
import NetworkCore

public struct DiscogsDataRemoteDataSource {
    
    public static var searchArtistByName: SearchArtistByNameRemoteDataSource {
        return SearchArtistByNameAPI(service: NetworkCoreAPIConfig.shared.networkService)
    }
}

