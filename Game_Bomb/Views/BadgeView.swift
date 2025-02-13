//
//  BadgeView.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

final class BadgeView: UICollectionReusableView {
    static let reuseIdentifier = "BadgeView"
    
    //MARK: - Private Methods
    private var badgeImage = UIImageView()
    private var isChecked = Bool()
    private var book: Model?
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    init(books: Model) {
        super.init(frame: .zero)
        self.book = books
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func configureBadge(with image: UIImageView) {
        isHidden = false
        badgeImage.image = image.image
    }
}


private extension BadgeView {
    func setupView() {
        badgeImage.tintColor = .black
        badgeImage.frame.size = CGSize(width: 24, height: 24)
        addSubview(badgeImage)
    }
}
