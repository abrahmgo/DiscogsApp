//
//  ImageViewData.swift
//  DiscogsUI
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import Foundation

public protocol ImageViewDataType {
    var urlImage: String { get }
}

public struct ImageViewData: ImageViewDataType {
    public let urlImage: String
    
    public init(urlImage: String) {
        self.urlImage = urlImage
    }
}
