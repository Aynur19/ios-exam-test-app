//
//  AssetsProtocols.swift
//  ExamTestApp
//
//  Created by Aynur Nasybullin on 03.06.2025.
//

import SwiftUI

public protocol ColorAssetsProtocol {
    var color: Color { get }
}

public protocol ImageAssetsProtocol {
    var image: Image { get }
}

public protocol StringAssetsProtocol {
    var string: String { get }
}
