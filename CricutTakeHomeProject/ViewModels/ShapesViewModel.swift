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
    @Published var isLoading = false
    @Published var shapes: [DrawPath] = []
    
    let serviceManager: ShapesServiceProtocol
    
    init(serviceManager: ShapesServiceProtocol) {
        self.serviceManager = serviceManager
    }
    
    func getShapes() async {
        defer {
            isLoading = false
        }
        isLoading = true
        do {
            shapesButtons = try await serviceManager.getShapes()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func addShape(_ type: DrawPath) {
        shapes.append(type)
    }
    
    func clearAll() {
        shapes.removeAll()
    }
    
    func removeLastCircle() {
        if let lastCircle = shapes.lastIndex(where:  { $0.shape == .circle }) {
            shapes.remove(at: lastCircle)
        }
    }
    
    func removeAllCircle() {
        shapes.removeAll(where: { $0.shape == .circle })
    }
    
}
