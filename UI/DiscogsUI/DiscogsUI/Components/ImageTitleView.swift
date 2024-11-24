//
//  ImageTitleView.swift
//  DiscogsUI
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import SwiftUI
internal import NukeUI
internal import Nuke

public struct ImageTitleView: View {
    
    private let pipeline = ImagePipeline {
        $0.dataLoader = {
            let config = URLSessionConfiguration.default
            config.urlCache = nil
            return DataLoader(configuration: config)
        }()
        $0.imageCache = ImageCache()
        $0.dataCache = try! DataCache(name: "com.andres.DiscogsUI")
    }
    
    private let model: ImageTitleViewDataType
    
    public init(model: ImageTitleViewDataType) {
        self.model = model
    }
    
    public var body: some View {
        HStack(spacing: 5) {
            makeImage(url: model.urlImage)
            Text(model.title)
                .font(.headline)
            Spacer()
        }
        .padding()
    }
    
    func makeImage(url: String) -> some View {
        LazyImage(url: URL(string: url)) { state in
            if let image = state.image {
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            } else {
                Color.gray.opacity(0.2)
                    .frame(width: 50, height: 50)
            }
        }
        .pipeline(pipeline)
        .frame(height: 320)
    }
}

#Preview {
    ImageTitleView(model: ImageTitleViewDataMock())
}

struct ImageTitleViewDataMock: ImageTitleViewDataType {
    var id : String = UUID().uuidString
    var title: String = "Luis Miguel"
    var urlImage: String = "https://i.discogs.com/9jtopJV_AtNtViuedtsCG8tKNaBNXkHxI1AFv9aXksg/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTkyNzkz/LTE2OTIzMjA3NDEt/NDk5NC5qcGVn.jpeg"
}
