//
//  ShapesViewModel.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation

@MainActor
class ShapesViewModel: ObservableObject {
    @Published var shapesButtons: ShapeTypes = ShapeTypes(buttons: [])
    @Published var errorMessage: String?
    @Published var shapes = [Shapes(shape: "Circle", draw_path: "circle")]
    
    let serviceManager: ShapesServiceProtocol
    
    
    init(serviceManager: ShapesServiceProtocol) {
        self.serviceManager = serviceManager
    }
    
    func getShapes() async {
        do {
            shapesButtons = try await serviceManager.getShapes()
            print(shapesButtons)
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }
    
    
    func addShape(_ type: String) {
        shapes.append(Shapes(shape: type, draw_path: type))
    }
    
    
    
}
