//
//  ArtistView.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import SwiftUI
import DiscogsUI
import DiscogsEntities

struct ArtistView: View {
    
    @ObservedObject private var viewModel: ArtistViewModel
    
    init(viewModel: ArtistViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView([.vertical], showsIndicators: true) {
            VStack(alignment: .leading,spacing: 20) {
                
                Text(viewModel.model.title)
                    .font(.system(size: 34)
                        .weight(.heavy))
                Text(viewModel.model.resume)
                    .font(.system(.title2,
                                  design: .rounded)
                        .weight(.light))
                Text("Releases")
                    .font(.system(size: 28)
                        .weight(.medium))
                ForEach(0..<viewModel.releases.count, id: \.self) { item in
                    InfoDetailView(model: viewModel.releases[item])
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .clipped()
                }
            }
            .padding()
            .safeAreaInset(edge: .top, content: {
                ImageView(url: viewModel.model.coverImageURL)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .clipped()
                
            })
        }
        .onAppear() {
            viewModel.setViewData()
        }
    }
}

#Preview {
    ArtistFactory.buildSU(artist: ArtistSearch(id: 92793, name: "LM", thumb: "", coverImage: "https://i.discogs.com/GiJzo7Ylt9SUeXQzRebEghSKySu7co2sRlCOEzIR8Zo/rs:fit/g:sm/q:90/h:366/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTkyNzkz/LTE2OTIzMjA3NDEt/NDk5NC5qcGVn.jpeg", resourceUrl: "https://api.discogs.com/artists/92793"))
}

protocol ArtistViewViewDataType {
    var title: String { get }
    var resume: String { get }
    var coverImageURL: String { get }
}
