//
//  ShapesModel.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation
import SwiftUI

struct ButtonTypes: Codable {
    let buttons: [ButtonsModel]
}

struct ButtonsModel: Codable {
    let name: String?
    let draw_path: DrawPath
}

struct DrawPath: Codable {
    let shape: ShapeType
    let style: ShapeStyle
    
}

enum ShapeType: String, Codable{
    case circle
    case square
    case triangle
}


enum ShapeStyle: String, Codable{
    case filled
    case dotted
    case stroked
}

