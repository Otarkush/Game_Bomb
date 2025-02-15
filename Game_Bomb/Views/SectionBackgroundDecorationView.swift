//
//  SectionBackgroundDecorationView.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit


final class SectionBackgroundDecorationView: UICollectionReusableView {
    static let reuseIdentifier = "SectionBackgroundDecorationView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

private extension SectionBackgroundDecorationView {
    func configure() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(resource: .bgCategory)
        backgroundImage.contentMode = .scaleToFill
        addSubview(backgroundImage)
        sendSubviewToBack(backgroundImage)
    }
}
