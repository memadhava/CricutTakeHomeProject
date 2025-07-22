//
//  GridView.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import SwiftUI

struct EditCirclesView: View {
    
    @ObservedObject var viewModel: ShapesViewModel
    
    //let circles: [ShapeType]
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    var body: some View {
        
        let circles = viewModel.shapes.filter { $0.shape == .circle }
        
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(circles.indices, id: \.self) { index in
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.cyan)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Button("Delete all") {
                        viewModel.removeAllCircle()
                    }
                    Button("Add") {
                        viewModel.addShape(DrawPath(shape: .circle, style: .filled))
                    }
                    Button("Remove") {
                        viewModel.removeLastCircle()
                    }
                }
            }
        }
        
    }
}

#Preview {
    EditCirclesView(viewModel: ShapesViewModel(serviceManager: ShapesServiceManager()))
}
