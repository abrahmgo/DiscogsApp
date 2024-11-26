//
//  Pagination.swift
//  DiscogsEntities
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import Foundation

public struct Pagination {
    
    public let page: Int
    public let pages: Int
    public let perPage: Int
    public let total: Int
    public let urls: PaginationURLs?
    
    public init(page: Int, pages: Int, perPage: Int, total: Int, urls: PaginationURLs? = nil) {
        self.page = page
        self.pages = pages
        self.perPage = perPage
        self.total = total
        self.urls = urls
    }
}

public struct PaginationURLs {
    
    public let last: String
    public let next: String
    
    public init(last: String, next: String) {
        self.last = last
        self.next = next
    }
}
