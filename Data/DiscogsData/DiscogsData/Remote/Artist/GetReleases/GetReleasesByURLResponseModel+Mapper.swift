//
//  GetReleasesByURLResponseModel+Mapper.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities

extension GetReleasesResponseModel {
    
    func mapToRelease() -> ArtistRelease {
        return ArtistRelease(format: format, id: id, title: title,
                             subtilte: label, imageURL: thumb, year: year)
    }
}
