//
//  Model.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

struct Model: Hashable {
    let type: String
    let image: String
    var isMark: Bool = false
    let questions: [Questions]
}


struct Questions: Hashable {
    let question: String
}
