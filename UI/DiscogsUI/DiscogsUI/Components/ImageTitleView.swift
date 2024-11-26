//
//  ImageTitleView.swift
//  DiscogsUI
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import SwiftUI

public struct ImageTitleView: View {
    
    private let model: ImageTitleViewDataType
    
    public init(model: ImageTitleViewDataType) {
        self.model = model
    }
    
    public var body: some View {
        HStack(spacing: 5) {
            ImageView(url: model.urlImage)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            Text(model.title)
                .font(.headline)
            Spacer()
        }
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
