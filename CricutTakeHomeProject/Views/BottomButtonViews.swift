//
//  BottomButtonViews.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import SwiftUI

struct BottomButtonViews: View {
    var buttons: [String]
    
    var body: some View {
        HStack() {
            Button("Circle") {
                //Circle pressed.
            }
            Spacer()
            Button("Square") {
                //Square pressed.
            }
            Spacer()
            Button("Triangle") {
                //Triangle pressed.
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


#Preview {
    BottomButtonViews()
}
