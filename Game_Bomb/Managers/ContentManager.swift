//
//  ContentManager.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

protocol IContentManager {
    func getModel() -> [Model]
}

final class ContentManager {}

extension ContentManager: IContentManager {
    func getModel() -> [Model] {
        [
            Model(
                type: "О разном",
                image: "Image1",
                isMark: false,
                questions: [
                    Questions(question: "fgfggf1"),
                    Questions(question: "fgfggf2"),
                    Questions(question: "fgfggf3"),
                    Questions(question: "fgfggf4"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                ]),
            Model(
                type: "Спорт",
                image: "Image2",
                isMark: false,
                questions: [
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfg"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfgg"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfgf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgff"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfgf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf")
                ]),
            Model(
                type: "Искусство",
                image: "Image3",
                isMark: false,
                questions: [
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf")
                ]),
            Model(
                type: "Про жизнь",
                image: "Image4",
                isMark: false,
                questions: [
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf")
                ]),
            Model(
                type: "Знаменитости",
                image: "Image4",
                isMark: false,
                questions: [
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf")
                ]),
            Model(
                type: "Природа",
                image: "Image5",
                isMark: false,
                questions: [
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf"),
                    Questions(question: "fgfggf")
                ]),
        ]
    }
}
