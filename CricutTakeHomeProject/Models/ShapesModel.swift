//
//  ShapesModel.swift
//  CricutTakeHomeProject
//
//  Created by Madhav Gadve on 7/10/25.
//

import Foundation

struct Shapes: Codable {
    let buttons: [ButtonsModel]
}

struct ButtonsModel: Codable {
    let name: String
    let draw_path: String
}
