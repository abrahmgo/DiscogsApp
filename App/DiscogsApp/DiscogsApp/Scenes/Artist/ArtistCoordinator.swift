//
//  ArtistCoordinator.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import UIKit
import DiscogsEntities

struct ArtistCoordinator {
    
    private let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func start(artist: ArtistSearch) {
        let view = ArtistFactory.build(artist: artist)
        self.view.navigationController?.pushViewController(view, animated: true)
    }
}
