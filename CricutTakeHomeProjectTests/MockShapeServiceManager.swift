//
//  MockShapeServiceManager.swift
//  CricutTakeHomeProjectTests
//
//  Created by Madhav Gadve on 7/17/25.
//

import XCTest
@testable import CricutTakeHomeProject

final class MockShapeServiceManager: XCTestCase, ShapesServiceProtocol {
    
    var showError = false
    
    func getShapes() async throws -> CricutTakeHomeProject.ButtonTypes {
        
        if !showError {
            let response = ButtonTypes(buttons: [ButtonsModel(name: "Circle", draw_path: .circle), ButtonsModel(name: "Triangle", draw_path: .triangle), ])
            return response
        } else {
            throw URLError(.badServerResponse)
        }
    }

}
