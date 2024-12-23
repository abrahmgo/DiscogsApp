//
//  DiscogsDataRemoteDataSource.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import DiscogsDataSource
import NetworkCore

public struct DiscogsDataRemoteDataSource {
    
    static var bundle: Bundle? {
        return Bundle(identifier: "com.andres.DiscogsData")
    }
    
    public static var searchArtistByName: SearchArtistByNameRemoteDataSource {
        return SearchArtistByNameAPI(service: NetworkCoreAPIConfig.shared.networkService)
    }
    
    public static var getArtistByURL: GetArtistByURLRemoteDataSource {
         return GetArtistByURLAPI(service: NetworkCoreAPIConfig.shared.networkService)
    }
    
    public static var getReleaseByURL: GetReleasesByURLRemoteDataSource {
        return GetReleasesByURLAPI(service: NetworkCoreAPIConfig.shared.networkService)
    }
}
