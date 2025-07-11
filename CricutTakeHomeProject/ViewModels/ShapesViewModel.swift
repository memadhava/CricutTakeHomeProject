//
//  ShapesViewModel.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation

@MainActor
class ShapesViewModel: ObservableObject {
    @Published var shapesButtons: ButtonTypes = ButtonTypes(buttons: [])
    @Published var errorMessage: String?
    @Published var shapes: [ShapeType] = []
    
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
    
    
    func addShape(_ type: ShapeType) {
        shapes.append(type)
    }
    
    func clearAll() {
        shapes.removeAll()
    }
    
    func removeLastCircle() {
        if let lastCircle = shapes.lastIndex(of: .circle) {
            shapes.remove(at: lastCircle)
        }
    }
    
    func removeAllCircle() {
        shapes.removeAll { shape in
            shape == .circle
        }
    }
    
}
