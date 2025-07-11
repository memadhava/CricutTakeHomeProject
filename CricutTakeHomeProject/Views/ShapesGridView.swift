//
//  ShapesGridView.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import SwiftUI

struct ShapesGridView: View {
    
    @StateObject var viewModel = ShapesViewModel(serviceManager: ShapesServiceManager())
    
    @State var buttonShapes = [String]()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.shapes, id: \.id) { shape in
                    Text(shape.shape)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Clear All") {
                        //Clear All action
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Edit circle") {
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    ScrollView(.horizontal){
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
}



#Preview {
    ShapesGridView()
}
