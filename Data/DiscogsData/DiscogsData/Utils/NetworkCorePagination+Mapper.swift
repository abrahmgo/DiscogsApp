//
//  NetworkCorePagination+Mapper.swift
//  DiscogsData
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import NetworkCore
import DiscogsEntities

extension NetworkCorePagination {
    
    func mapToPagination() -> Pagination {
        return Pagination(page: page,
                          pages: pages,
                          perPage: per_page,
                          total: items,
                          urls: urls.mapToPaginationURLs())
    }
}

extension NetworkCorePaginationURLs {
     
    func mapToPaginationURLs() -> PaginationURLs {
        return PaginationURLs(last: last,
                              next: next)
    }
}
