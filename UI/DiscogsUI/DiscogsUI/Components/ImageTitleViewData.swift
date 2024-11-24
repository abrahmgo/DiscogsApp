//
//  ImageTitleViewData.swift
//  DiscogsUI
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import Foundation

public protocol ImageTitleViewDataType {
    var id: String { get }
    var title: String { get }
    var urlImage: String { get }
}

public struct ImageTitleViewData: ImageTitleViewDataType {
    public let id: String
    public let title: String
    public let urlImage: String
    
    public init(id: String, title: String, urlImage: String) {
        self.id = id
        self.title = title
        self.urlImage = urlImage
    }
}
