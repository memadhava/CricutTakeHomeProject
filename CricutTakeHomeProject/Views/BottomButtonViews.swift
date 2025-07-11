//
//  BottomButtonViews.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import SwiftUI

struct BottomButtonViews: View {
    var buttons: [ButtonsModel]
    var action: (ShapeType) -> Void
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach(buttons, id: \.draw_path) { button in
                    Button(button.name ?? "NA") {
                        action(button.draw_path)
                    }
                }
            }
            .padding()
        }
    }
}
