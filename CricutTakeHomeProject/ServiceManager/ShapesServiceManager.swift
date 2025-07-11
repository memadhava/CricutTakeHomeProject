//
//  ShapesServiceManager.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation

private let shapesURL = "https://staticcontent.cricut.com/static/test/shapes_001.json"

protocol ShapesServiceProtocol {
    func getShapes() async throws -> ShapeTypes
}

class ShapesServiceManager: ShapesServiceProtocol {
    
    func getShapes() async throws -> ShapeTypes {
        guard let url = URL(string: shapesURL) else {
            throw URLError(.badURL)
        }
        return try await RequestManager.shared.getData(url: url)
    }
    
}
