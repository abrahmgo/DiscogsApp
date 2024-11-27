//
//  NetworkCorePagination.swift
//  NetworkCore
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import Foundation

public struct NetworkCorePagination: Codable {
    
    public let page: Int
    public let pages: Int
    // swiftlint:disable:next identifier_name
    public let per_page: Int
    public let items: Int
    public let urls: NetworkCorePaginationURLs?
}

public struct NetworkCorePaginationURLs: Codable {
    
    public let last: String
    public let next: String
}
