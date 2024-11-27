//
//  UISearchBar.swift
//  DiscogsUtils
//
//  Created by Andrés Abraham Bonilla Gómez on 23/11/24.
//

import SwiftUI

public extension UISearchBar {
    
    /// Agrega una acción personalizada al botón "Cancelar"
    func setCancelButtonAction(_ action: @escaping () -> Void) {
        let originalSelector = #selector(self.cancelButtonTapped)
        let swizzledSelector = #selector(self.customCancelButtonTapped)
        
        if let originalMethod = class_getInstanceMethod(UISearchBar.self, originalSelector),
           let swizzledMethod = class_getInstanceMethod(UISearchBar.self, swizzledSelector) {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
        
        objc_setAssociatedObject(self, &AssociatedKeys.cancelAction, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    @objc private func cancelButtonTapped() {}
    
    @objc private func customCancelButtonTapped() {
        (objc_getAssociatedObject(self, &AssociatedKeys.cancelAction) as? () -> Void)?()
        self.customCancelButtonTapped()
    }
}

private struct AssociatedKeys {
    
    static var cancelAction = "cancelAction"
}
