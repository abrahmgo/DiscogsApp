//
//  ImageView.swift
//  DiscogsUI
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import SwiftUI
internal import NukeUI
internal import Nuke

public struct ImageView: View {
    
    private let pipeline = ImagePipeline {
        $0.dataLoader = {
            let config = URLSessionConfiguration.default
            config.urlCache = nil
            return DataLoader(configuration: config)
        }()
        $0.imageCache = ImageCache()
        // swiftlint:disable:next force_try
        $0.dataCache = try! DataCache(name: "com.andres.DiscogsUI")
    }
    
    private let url: String
    
    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        makeImage(url: url)
    }
    
    func makeImage(url: String) -> some View {
        LazyImage(url: URL(string: url)) { state in
            if let image = state.image {
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            } else {
                Color.gray.opacity(0.2)
            }
        }
        .pipeline(pipeline)
    }
}

#Preview {
    // swiftlint:disable:next line_length
    ImageView(url: "https://i.discogs.com/9jtopJV_AtNtViuedtsCG8tKNaBNXkHxI1AFv9aXksg/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTkyNzkz/LTE2OTIzMjA3NDEt/NDk5NC5qcGVn.jpeg")
}
