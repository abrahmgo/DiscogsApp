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
        List {
            ForEach(0..<viewModel.artists.count, id: \.self) { item in
                paint(data: viewModel.artists[item])
            }
        }
        .listStyle(.grouped)
        .navigationBarTitle("Search", displayMode: .large)
        .searchable(text: $viewModel.searchText, prompt: "Look for something")
        .onChange(of: viewModel.searchText) { searchText in
            if searchText.isEmpty {
                viewModel.setDefault()
            } else {
                viewModel.searchArtist(name: searchText)
            }
        }
        .padding()
        .onViewDidLoad() {
            viewModel.setDefault()
        }
    }
    
    @ViewBuilder
    private func paint(data: ImageTitleViewDataType) -> some View {
        ImageTitleView(model: data)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .onTapGesture {
                viewModel.goToArtist(id: data.id)
            }
            .onAppear() {
                if viewModel.artists.last?.id == data.id {
                    viewModel.moreArtist()
                }
            }
    }
}
