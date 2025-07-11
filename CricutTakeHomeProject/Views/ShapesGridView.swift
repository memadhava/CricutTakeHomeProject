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
        VStack {
            TopButtonViews()
            Spacer()
            BottomButtonViews(buttons: viewModel.shapesButtons.buttons)
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
