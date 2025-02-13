//
//  CategoryRulesViewController.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

final class CategoryRulesViewController: UIViewController {
    
    private let question = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    func configure(text: Model) {
        question.text = text.questions.debugDescription
        
    }
}
