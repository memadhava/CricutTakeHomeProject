//
//  BottomButtonViews.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import SwiftUI

struct BottomButtonViews: View {
    var buttons: [ButtonsModel]
    var action: (DrawPath) -> Void
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(buttons, id: \.name) { button in
                    Button(button.name ?? "NA") {
                        action(button.draw_path)
                    }
                }
            }
            .padding()
        }
    }
}
