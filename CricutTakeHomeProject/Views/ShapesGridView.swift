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
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.shapes.indices, id: \.self) { index in
                        switch viewModel.shapes[index] {
                        case .circle:
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.cyan)
                        case .square:
                            Rectangle()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.cyan)
                        case .triangle:
                            TriangleShape()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.cyan)
                        }
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
                    ScrollView(.horizontal, showsIndicators: false){
                        Spacer()
                        BottomButtonViews(buttons: viewModel.shapesButtons.buttons, action: { shape in
                            viewModel.addShape(shape)
                        })
                        Spacer()
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
}



#Preview {
    ShapesGridView()
}
