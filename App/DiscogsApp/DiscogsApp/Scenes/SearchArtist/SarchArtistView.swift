//
//  SarchArtistView.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import DiscogsUI
import SwiftUI
import DiscogsUtils

struct SarchArtistView: View {
    
    @ObservedObject var viewModel: SearchArtistViewModel
    
    init(viewModel: SearchArtistViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.artists, id: \.id) { data in
                    ImageTitleView(model: data)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .onAppear() {
                            if viewModel.artists.last?.id == data.id {
                                viewModel.moreArtist()
                            }
                        }
                }
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchText, prompt: "Look for something")
            .onChange(of: viewModel.searchText) { searchText in
                if searchText.isEmpty {
                    viewModel.setFavorites()
                } else {
                    viewModel.searchArtist(name: searchText)
                }
            }
        }
    }
}
