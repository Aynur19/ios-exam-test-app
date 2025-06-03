//
//  SharedAssets.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

struct SharedAssets { }

extension SharedAssets {
    enum Icons: String, ImageAssetsProtocol {
        case icon
        
        public var image: Image {
            Image("Icons/" + self.rawValue)
        }
    }
}
