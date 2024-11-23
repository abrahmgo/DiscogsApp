//
//  ContentView.swift
//  DiscogsApp
//
//  Created by Andrés Abraham Bonilla Gómez on 22/11/24.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            viewModel.testUseCase()
        }
    }
}

#Preview {
    ContentView()
}
