//
//  SettingsCollectionViewCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 11.04.2022.
//

import Foundation

class SettingsCollectionViewCellViewModel {
    
    let parameterName: String
    let parameterMetrics: [String]
    
    init(parameterName: String, parameterMetrics: [String]) {
        self.parameterName = parameterName
        self.parameterMetrics = parameterMetrics
    }
}
