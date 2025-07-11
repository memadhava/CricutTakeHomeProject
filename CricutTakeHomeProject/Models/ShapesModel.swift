//
//  ShapesModel.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation

struct ShapeTypes: Codable {
    let buttons: [ButtonsModel]
}

struct ButtonsModel: Codable {
    let name: String?
    let draw_path: String?
}


struct Shapes {
    let id = UUID()
    let shape: String
    let draw_path: String
}

