//
//  ContentDataManager.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit


protocol IContentDataManager {
    func getModelData() -> [Model]
    func toggleSelected(_ item: Model)
    func getSelectedModels() -> [Model]
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
    
    func getSelectedModels() -> [Model] {
        return model.filter { $0.isMark }
    }

}
