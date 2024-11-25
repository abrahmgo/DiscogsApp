//
//  GetArtistByURLResponseModel+Mapper.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities

extension GetArtistByURLResponseModel {
    
    func mapToArtist() -> ArtistInfo {
        return ArtistInfo(id: id,
                          name: name,
                          profile: profile,
                          releaseURL: releases_url,
                          images: images.map{$0.mapToImages()})
    }
}

extension GetArtistByURLImageResponseModel {
    
    func mapToImages() -> AtistImage {
        return AtistImage(type: DiscogsType(rawValue: type) ?? .unknown,
                          url: uri)
    }
}
