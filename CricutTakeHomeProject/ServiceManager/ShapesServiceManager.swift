//
//  ShapesServiceManager.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation

protocol ShapesServiceProtocol {
    func getShapes() async throws -> Shapes
}

class ShapesServiceManager: ShapesServiceProtocol {
    
    func getShapes() async throws -> Shapes {
        
        guard let url = URL(string: "http://staticcontent.cricut.com/static/test/shapes_001.json") else {
            throw URLError(.badURL)
        }
        return try await RequestManager.shared.getData(url: url)
    }
    
}
