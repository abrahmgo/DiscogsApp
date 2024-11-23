//
//  NetworkCoreData.swift
//  NetworkCore
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import Foundation

public struct NetworkCoreData<T: Decodable>: Decodable {

    public let results: T?
    public let pagination: NetworkCorePagination
}
