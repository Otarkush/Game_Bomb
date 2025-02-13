//
//  ContentDataManager.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit


protocol IContentDataManager {
    func getModelData() -> [Model]
    func getSelectedCategory() -> [Model]
}

final class ContentDataManager {
    //MARK: - Private property
    private var model: [Model] = []
    
    
    //MARK: - Init
    init(model: [Model]) {
        self.model = model
    }
}


extension ContentDataManager: IContentDataManager {
    
    func getModelData() -> [Model] {
        model
    }
    
    func getSelectedCategory() -> [Model] {
        var selectedCategoryArray: [Model] = []
        
        model.forEach { if $0.isMark{selectedCategoryArray.append($0)}}
        
        return selectedCategoryArray
    }
    
    
}
