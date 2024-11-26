//
//  ReleasesView.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import SwiftUI
import DiscogsUI
import DiscogsUtils

struct ReleasesView: View {
    
    @ObservedObject private var viewModel: ReleasesViewModel
    
    init(viewModel: ReleasesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(0..<viewModel.releases.count, id: \.self) { item in
                paint(data: viewModel.releases[item])
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle(Text("Releases"))
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            Menu("Filtering") {
                Button("Year", action: viewModel.sortYear)
                Button("Title", action: viewModel.sortTitle)
                Button("Format", action: viewModel.sortFormat)
            }
        }
        .onViewDidLoad() {
            viewModel.setViewData()
        }
    }
    
    @ViewBuilder
    private func paint(data: InfoDetailViewDataType) -> some View {
        InfoDetailView(model: data)
            .frame(maxWidth: .infinity, maxHeight: 100)
            .onTapGesture {
                //viewModel.goToArtist(id: data.id)
            }
            .onAppear() {
                if viewModel.releases.last?.id == data.id {
                    viewModel.more()
                }
            }
    }
}

#Preview {
    NavigationView { ReleasesFactory.buildSU(releasesURL: "https://api.discogs.com/artists/92793/releases") }
}
