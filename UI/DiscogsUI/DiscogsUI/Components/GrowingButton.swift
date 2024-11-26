//
//  GrowingButton.swift
//  DiscogsUI
//
//  Created by Andrés Abraham Bonilla Gómez on 26/11/24.
//

import SwiftUI

public struct GrowingButton: ButtonStyle {
    
    public init () { }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
