//
//  ShapesViewModel.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation

@MainActor
class ShapesViewModel: ObservableObject {
    @Published var shapesButtons: Shapes = Shapes(buttons: [])
    @Published var errorMessage: String?
    
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
    
    
    
}
