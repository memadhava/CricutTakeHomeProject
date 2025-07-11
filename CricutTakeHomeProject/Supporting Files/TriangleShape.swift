//
//  TriangleShape.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/11/25.
//

import SwiftUI

struct TriangleShape: Shape {
    
    //This method is responsible creating a Triangle shape
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
    
    

}
