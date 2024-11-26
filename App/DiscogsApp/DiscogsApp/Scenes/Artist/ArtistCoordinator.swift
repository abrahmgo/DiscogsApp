//
//  ArtistCoordinator.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import UIKit
import DiscogsEntities

struct ArtistCoordinator: ArtistRouterType {
    
    private let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func start(artist: ArtistSearch) {
        let view = ArtistFactory.build(artist: artist, router: self)
        self.view.navigationController?.pushViewController(view, animated: true)
    }
    
    func goToReleases(url: String) {
        let view = ReleasesFactory.build(releasesURL: url)
        self.view.navigationController?.pushViewController(view, animated: true)
    }
}
