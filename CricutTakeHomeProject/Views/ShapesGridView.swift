//
//  ShapesGridView.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import SwiftUI

struct ShapesGridView: View {
    
    @StateObject var viewModel = ShapesViewModel(serviceManager: ShapesServiceManager())
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
        
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.shapes.indices, id: \.self) { index in
                            updateShape(viewModel.shapes[index])
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.cyan)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Clear All") {
                            viewModel.clearAll()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink("Edit circle") {
                            EditCirclesView(viewModel: viewModel)
                        }
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        BottomButtonViews(buttons: viewModel.shapesButtons.buttons, action: { shape in
                            viewModel.addShape(shape)
                        })
                    }
                }
            }
            
        }
        .onAppear {
            Task {
                await viewModel.getShapes()
            }
        }
    }
    
    //To avoid setting frame and color multiple times, created this method to reduce duplicate code
    func updateShape(_ shape: ShapeType) -> some View{
        switch shape {
        case .circle:
            return AnyView(Circle())
        case .square:
            return AnyView(Rectangle())
        case .triangle:
            return AnyView(TriangleShape())
        }
    }

}



#Preview {
    ShapesGridView()
}
