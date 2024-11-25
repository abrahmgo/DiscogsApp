//
//  SearchArtistCoordinator.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import DiscogsEntities
import UIKit

class SearchArtistCoordinator: SearchArtistRouterType {
    
    weak var view: UIViewController?
    
    func goToArtistDetail(with artist: ArtistSearch) {
        print("go to artist detail")
        print(view)
        print(artist)
    }
    
    func start() -> UIViewController {
        let view = SearchArtistFactory.build(router: self)
        self.view = view
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
}
