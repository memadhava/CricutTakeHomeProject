//
//  BottomButtonViews.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import SwiftUI

struct BottomButtonViews: View {
    var buttons: [ButtonsModel]
    
    var body: some View {
        HStack {
            ForEach(buttons, id: \.draw_path) { button in
                Button(button.name) {
                    //Button actions
                }
            }
        }
        .padding()
        
        
    }
}

struct TopButtonViews: View {
    var body: some View {
        HStack {
            Button("Clear All"){
                
            }
            Spacer()
            Button("Edit Circle"){
                
            }
        }
        .padding()
    }
}


//#Preview {
//    BottomButtonViews()
//}
