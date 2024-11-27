//
//  InfoDetailViewData.swift
//  DiscogsUI
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import Foundation

public protocol InfoDetailViewDataType {
    var id: Int { get }
    var title: String { get }
    var subtitle: String { get }
    var subtitle2: String { get }
    var subtitle3: String { get }
    var urlImage: String { get }
}

public struct InfoDetailViewData: InfoDetailViewDataType {
    
    public let id: Int
    public let title: String
    public let subtitle: String
    public let subtitle2: String
    public let subtitle3: String
    public let urlImage: String
    
    public init(id: Int,
                title: String,
                subtitle: String,
                subtitle2: String,
                subtitle3: String,
                urlImage: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.subtitle2 = subtitle2
        self.subtitle3 = subtitle3
        self.urlImage = urlImage
    }
}
