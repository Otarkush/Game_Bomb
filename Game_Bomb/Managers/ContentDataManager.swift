//
//  ContentDataManager.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit


protocol IContentDataManager {
    func getModelData() -> [Model]
    func getSelectedQuestion() -> [Model]
    func toggleSelected(_ item: Model)
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
    
    func toggleSelected(_ item: Model) {
        if let index = model.firstIndex(of: item) {
            model[index].isMark.toggle()
        }
    }
    
    
    func getSelectedQuestion() -> [Model] {
        var selectedCategoryArray: [Model] = []
        
        let modelArray = getModelData()
        for model in modelArray {
            if model.isMark {
                selectedCategoryArray.append(model)
            }
        }
        return selectedCategoryArray
    }
}
