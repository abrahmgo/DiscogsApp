//
//  InfoDetailView.swift
//  DiscogsUI
//
//  Created by Andrés Abraham Bonilla Gómez on 25/11/24.
//

import SwiftUI

public struct InfoDetailView: View {
    
    private let model: InfoDetailViewDataType
    
    public init(model: InfoDetailViewDataType) {
        self.model = model
    }
    
    public var body: some View {
        HStack(spacing: 5) {
            ImageView(url: model.urlImage)
                .frame(width: 50, height: 50)
                .padding()
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.system(size: 16)
                        .weight(.medium))
                Text(model.subtitle)
                    .font(.system(size: 16)
                        .weight(.medium))
                Text(model.subtitle2)
                    .font(.system(size: 16)
                        .weight(.medium))
                Text(model.subtitle3)
                    .font(.system(size: 16)
                        .weight(.medium))
            }
            Spacer()
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    InfoDetailView(model: InfoDetailViewData(id: 1, title: "Title", subtitle: "Subtitle", subtitle2: "Subtitle2", subtitle3: "Subtitle3", urlImage: "https://images.unsplash.com/photo-15-11e-11e8-11e8-11e80011e800?ixid=MnwxMjA3fDB8MHxzZWFyY2h"))
}
