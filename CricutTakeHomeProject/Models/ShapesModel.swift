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
    let draw_path: ShapeType
}

enum ShapeType: String, Codable{
    case circle
    case square
    case triangle
}

