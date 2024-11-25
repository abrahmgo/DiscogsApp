//
//  SearchArtistByNameResponseModel+Mapper.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import DiscogsEntities

extension SearchArtistByNameResultsResponseModel {
    
    func mapToSearchArtist() -> ArtistSearch {
        return ArtistSearch(id: id,
                            name: title,
                            thumb: thumb,
                            coverImage: cover_image,
                            resourceUrl: resource_url)
    }
}
